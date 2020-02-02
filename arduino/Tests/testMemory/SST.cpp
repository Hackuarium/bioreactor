#include "Arduino.h"
#include "SST.h"
#include "SPI.h"

/**********************************************************************************
 * This library is an updated library from the SST library compatible with        *
 * he SST25VF chip. It has been designed to be compatible with an SST26VF         *
 * chip. A new attribute has been added which expresses whether the chip is       *
 * SST25 or SST26. Implementation is then conditionnal depending on its type.     *
 *                                                                *
 * HOW TO USE                                                     *
 * ==========                                                     *
 *                                                              *
 * Object SST has to be initialized with port name and pin number.              *
 *                                                              *
 * Before using (after construction), the init function has to be run, in order   *
 * to write the status and configuration registers.                         *
 *                                                              *
 * When launching READ sequence, first use the flashReadInit function, then use   *
 * the corresponding method (depending on the desired type). When done reading,   *
 * enter flashReadFinish.                                             *
 *                                                                *
 * When launching WRITE sequence, first use the flashWriteInit function, then use *
 * the corresponding method (depending on the desired type). When done reading,   *
 * enter flashWriteFinish.                                            *
 *                                                              *
 * Two methods are available for erasing. The Sector Erase and the total erase.   *
 *                                                                                *
 * printFlashID method allows to print the flash ID on output and displays      *
 *  MANUFACTURER ID | DEVICE TYPE (25 or 26) | DEVICE ID                          *
 * printStatusRegister and printConfigRegister both allow to check the status and *
 * configuration register of the chip respectively.                               *
 *                                                                                *
 * Added methods allowing to controll Block-protection. On initialization, all    *
 * block-protection is removed.                                                   *
 **********************************************************************************/

// PUBLIC METHODS----------------------------------------------------

 SPISettings spiSettings;




SST::SST(char port, int pin) {
    switch (port)
    {
        #ifdef PORTA
        case 'A':
            memPort = &PORTA;
            DDRA |= _BV(pin);
            break;
        #endif
        #ifdef PORTB
        case 'B':
            memPort = &PORTB;
            DDRB |= _BV(pin);
            break;
        #endif
        #ifdef PORTC
        case 'C':
            memPort = &PORTC;
            DDRC |= _BV(pin);
            break;
        #endif
        #ifdef PORTD
        case 'D':
            memPort = &PORTD;
            DDRD |= _BV(pin);
            break;
        #endif
        #ifdef PORTE
        case 'E':
            memPort = &PORTE;
            DDRE |= _BV(pin);
            break;
        #endif
        #ifdef PORTF
        case 'F':
            memPort = &PORTF;
            DDRF |= _BV(pin);
            break;
        #endif
        default:
            memPort = NULL;
            break; // exception handling not supported
    }
    _ssPin = pin;
    /*
    * Initialization of flashVersion attribute
    * As default, we will consider SST26VF as the default chip and
    * these settings will be used.
    * flashVersion is checked in init function
    */
    flashVersion = 0x26;
    spiSettings = SPISettings(8000000, MSBFIRST, SPI_MODE0);
}


/**********************************************************************/
void SST::init()
{
   /********************************************
    * Initialisation of flashVersion attribute *
    * This can't be done in constructor as SPI *
    * protocol is not started at that time.  *
    ********************************************/

    // Whey we need to call this twice ?????
    // otherwise only for some memory ... we don't have the right ID !
    flashSelect();
    flashDeselect();


    flashSelect();
    SPI.transfer(0x9F);    // read ID command
    SPI.transfer(0);     // Manufacturer ID
    flashVersion = SPI.transfer(0); // Device Type (25H if SST25 or 26H if SST26)
    SPI.transfer(0);     // Unique Device ID
    flashDeselect();

  /******************************
   * Initialisation of SST chip *
   * Writing of both status and *
   * configuration register.  *
   ******************************/

    switch (flashVersion)
    {
        case 0x25:
            flashSelect();
            SPI.transfer(0x50); // EWSR : Enable Write Status Register, must be issued prior to WRSR
            flashDeselect();
            delay(25);
            break;
        case 0x26:         // default is SST26
            flashWREN();
            break;
        default:
            return; // change function to return -1 when error ?
    }

     // Write protection Enable bit has a maximal time latency of 25ms
    flashSelect();
    SPI.transfer(0x01); // Instruction: write the status register

    /**********************************************************************
     *  If SST25VF: Only consider the Status register command, bytes sent *
     * must be xx0000xx to remove all block protection                    *
     *                                                                    *
     * If SST26VF: Status register is read only, bytes sent don't matter. *
     * Status register must be followed by configuration register.        *
     * Bytes for configuration register must be x1xxxxx0                  *
     **********************************************************************/
    SPI.transfer(0x00); // Status register write for SST25, does nothing for SST26
    if (flashVersion == 0x26){
      SPI.transfer(0x02); //disable hold and write protect (config register)
    }
    flashDeselect();

    if(flashVersion == 0x26) flashClearBPR(); //unlock  all block access rights
}

/**********************************************************************/
// check OF NON EMPTY sectors
void SST::printNonEmptySector(Print* output)
{
    boolean memoryEmpty = true;
    // The memory contains 2048 sectors of 4096 bytes
    for (long x = 0; x < 2048; x++)
    {
        flashReadInit((4096UL * x));
        boolean sectorEmpty = true;
        for (int q = 0; q < 4096; q++)
        {
            if (flashReadNextInt8() != 0xFF)
            {
                sectorEmpty = false;
                memoryEmpty = false;
                break;
            }
        }

        if (!sectorEmpty)
        {
            output->print("Sector: ");
            if ((x + 1) < 10)
                output->print("00");
            else if ((x + 1) < 100)
                output->print("0");
            output->println(x + 1, DEC);
        }
        flashReadFinish();
    }
    if(memoryEmpty) output->println("No non-empty sectors");
}

/**********************************************************************/
void SST::printFlashID(Print* output)
{
    uint8_t manufacturer, mtype, uniqueId;
    flashSelect();
    (void)SPI.transfer(0x9F); // Read ID command
    manufacturer = SPI.transfer(0);     // Manufacturer ID
    mtype = SPI.transfer(0);  // Device Type (25 if SST25 or 26 if SST26)
    uniqueId = SPI.transfer(0);    // Device ID

    flashDeselect();
    char buf[16] = { 0 };
    sprintf(buf, "%02X %02X %02X", manufacturer, mtype, uniqueId);
    output->println(buf);
}

/**********************************************************************/
void SST::printStatusRegister(Print* output)
{
    uint8_t data = 0;
    flashSelect();
    SPI.transfer(0x05);
    data = SPI.transfer(0);
    flashDeselect();
    for(uint8_t i=0; i<8; ++i)
    {
        output->print(bitRead(data,7-i));
        nop();
    }
    output->print("\n");
}

/**********************************************************************/
void SST::printConfigRegister(Print* output)
{
       uint8_t data = 0;
    if(flashVersion != 0x26) return; //only available on sst26 version
    flashSelect();
    SPI.transfer(0x35);
    data = SPI.transfer(0);
    flashDeselect();
    for(uint8_t i(0); i<8; ++i)
    {
        output->print(bitRead(data,7-i));
        nop();
    }
    output->print("\n");
}

/**********************************************************************
                        READ UTILITIES
***********************************************************************/

void SST::flashReadInit(uint32_t addr)
{
    flashSelect();

    (void)SPI.transfer(0x03); // Read Memory - 25/33 Mhz //
    flashSetAddress(addr);
}

uint8_t SST::flashReadNextInt8()
{
    return SPI.transfer(0);
}

uint16_t SST::flashReadNextInt16()
{
    uint16_t result = 0;
    result = SPI.transfer(0);     // MSB
    result = result << 8;         // LSB
    result = result + SPI.transfer(0);
    return result;
}

/**********************************************************************/
uint32_t SST::flashReadNextInt32()
{
    uint32_t result = 0;
    // MSB
    result = SPI.transfer(0);
    result = result << 8;

    result = result + SPI.transfer(0);
    result = result << 8;

    result |= result + SPI.transfer(0);
    result = result << 8;
    // LSB
    result |= result + SPI.transfer(0);
    return result;
}

/**********************************************************************/
void SST::flashReadFinish()
{
    flashDeselect();
    flashWaitUntilDone();
}

/**********************************************************************
                        WRITE UTILITIES
***********************************************************************/

void SST::flashWriteInit(uint32_t address)
{
    flashWREN();
    flashSelect();
    (void)SPI.transfer(0x02); // Instruction : Page program (order to start writing bytes)
    flashSetAddress(address);
}

/**********************************************************************/
// Write up to 256 byte in the memory
void SST::flashWriteNextInt8(uint8_t data)
{
    (void)SPI.transfer(data); // Write Byte
}

/**********************************************************************/
void SST::flashWriteNextInt16(uint16_t data)
{
    flashWriteNextInt8((uint8_t)((data >> 8) & 0xFF));
    flashWriteNextInt8((uint8_t)(data & 0xFF));
}

/**********************************************************************/
void SST::flashWriteNextInt32(uint32_t data)
{
    flashWriteNextInt8((uint8_t)((data >> 24) & 0xFF));
    flashWriteNextInt8((uint8_t)((data >> 16) & 0xFF));
    flashWriteNextInt8((uint8_t)((data >> 8) & 0xFF));
    flashWriteNextInt8((uint8_t)(data & 0xFF));
}

/**********************************************************************/
void SST::flashWriteFinish()
{
    flashDeselect();
    // we need to keep this delay because for an unknown reason
    // the flashWaitUnitlDone does not work always
    //delay(2); //1.6ms max delay for page write
    flashWaitUntilDone();
}

/**********************************************************************
                    BLOCK UN/LOCK UTILITIES
***********************************************************************/
void SST::flashReadBPR(Print* output) // read block protection register
{
    if(flashVersion != 0x26) return;
    uint8_t BPR[18];
    flashSelect();
    SPI.transfer(0X72);
    for(uint8_t i=0; i<18;i++){
      BPR[i]=SPI.transfer(0X00);
    }
    flashDeselect();
    //delay(2); //1.6ms max delay for page write
    output->println("BPR registers");
    for(uint8_t i=0; i<18;i++){
      output->print("byte ");
      output->print(i);
      output->print(":");
      output->print(BPR[i] & 0xff,HEX);
      output->print("\n");
    }
}

/**********************************************************************/
void SST::flashWriteBPR(uint8_t* BPR, int size) // configure block protection register
{                                               // size has to be initialized as sizeof(Tab)
    if(flashVersion != 0x26) return;
    if(size!=18) return;
    flashWREN();
    flashSelect();
    SPI.transfer(0X42); //read BPR instruction
    for(uint8_t i=0; i<18;i++){
      SPI.transfer(BPR[i]);
    }
    flashDeselect();
    // delay(2); //1.6ms max delay for page write check if the same for BPR
    flashWaitUntilDone();
}

/**********************************************************************/
void SST::flashClearBPR(){ //unlock all blocks read write accesses
  if(flashVersion != 0x26) return;
  flashWREN();
  flashSelect();
  SPI.transfer(0X98); //Global Unlock BPR
  flashDeselect();
  delay(2);
}

/**********************************************************************/
void SST::flashLockDownBPR(){ //Lock R/W access and BPR config
  if(flashVersion != 0x26) return;
  flashWREN();
  flashSelect();
  SPI.transfer(0XE8); //Global Unlock BPR
  flashDeselect();
  delay(2);
}

/**********************************************************************/
void SST::flashLockAllLockDownBPR(uint8_t* BPR){ //prevent BPR config until reboot
  if(flashVersion != 0x26) return;
  if(sizeof(BPR)!=18) return; //to be checked
  flashWREN();
  flashSelect();
  SPI.transfer(0X8D); //Global Unlock BPR
  for(uint8_t i=0; i<18;i++){
    SPI.transfer(BPR[i]);
  }
  flashDeselect();
  delay(2);
}

/**********************************************************************
                       ERASE UTILITIES
***********************************************************************/

/*
Erase 4KB sectors - time needed : 18ms
Can only erase block of size 4096 byte => 2048 sectors on the chip
It is possible to erase larger area according to the datasheet :
64 KByte Block-Erase of memory array SPI : 1101 1000b (D8H) 3 0 0
*/
void SST::flashSectorErase(uint32_t address)
{
    flashWREN();
    flashSelect();
    (void)SPI.transfer(0x20); // Erase 4KB Sector //
    flashSetAddress(address);
    flashDeselect();
    // delay(25); //max delay for sector erase cf. datasheet
    flashWaitUntilDone();

}

void SST::flashTotalErase()
{
    flashWREN();
    flashSelect();
    (void)SPI.transfer(0xC7); // Instruction : Chip-Erase
    flashDeselect();
//    delay(50); //max delay for chip erase cf. datasheet
    flashWaitUntilDone();
}

/**********************************************************************
              PRIVATE METHODS: OTHER  UTILITIES
***********************************************************************/

// magic function
// No operation : Processor will ignore the instruction. Increments counter
inline void volatile SST::nop(void){ asm __volatile__("nop"); }
void SST::flashDeselect() {
    *memPort |= _BV(_ssPin);
    SPI.endTransaction();
}
void SST::flashSelect() {
    *memPort &= ~(_BV(_ssPin));
    SPI.beginTransaction(spiSettings);
}


void SST::flashWaitUntilDone()
{
    uint8_t data = 0;
    flashSelect();
    SPI.transfer(0x05); //read status register
    while (1)
    {
        data = SPI.transfer(0);
        if (!bitRead(data, 0)) {
            break;
        }
        delay(1);
    }

    flashDeselect();
}

void SST::flashSetAddress(uint32_t addr)
{
    (void)SPI.transfer((uint8_t)(addr >> 16));
    (void)SPI.transfer((uint8_t)(addr >> 8));
    (void)SPI.transfer((uint8_t)addr);
}

void SST::flashWREN(){
  flashSelect();
  SPI.transfer(0x06); // write enable instruction
  flashDeselect();
  delay(25); //max delay after write init sequence cf. datasheet
  flashWaitUntilDone();
}
