#include <SST.h>
#include <SPI.h>
#include <avr/io.h>
#include <arduino.h>

/************************************************************************************************************************
 * THIS IS A TEST PROGRAMM FOR THE SST LIBRARY                                                                          *
 * THE SST LIBRARY HAS BEEN DESIGNED FOR THE SST26VF CHIP BUT IS RETROCOMPATIBLE WITH THE SST25 CHIPS.                  *
 *                                                                                                                      *
 * THIS TEST CONSISTS OF SEVERAL SUBPARTS. PLEASE UNCOMMENT THE PARTS YOU'RE INTERESTED IN.                             *
 *                                                                                                                      *
 * PART 1 : Display of the status and configuration registers. This allows to see if the chip is properly initialized   *
 * PART 2 : Read and Write. Allows to verify if the chip properly displays and saves memory.                            *
 * PART 3 : Erasing functions. Checks if clearing the memory functions                                                  *
 * PART 4 : Block protection. Verifies if entering proper settings into the BPR functions effectively.                  *
 ************************************************************************************************************************/

#define ADDRESS_BEG   0x000000
#define ADDRESS_MAX   0x800000
#define SECTOR_SIZE   4096 // anyway the size of the sector is also hardcoded in the library !!!!

#define LINE_SIZE 64 // should be a divider of the SECTOR_SIZE

void setupMemory(SST& sst);
void printLine(long address, SST& sst);
void writeLine(long address, SST& sst);
void writeNonDisplayed(long address, SST& sst);

// ======================================================================================= //

void setup()
{

  /***********************
   * TEST INITIALIZATION *
   ***********************/
   
  Serial.begin(9600);
  while (!Serial); // Forces program to wait until Serial stream is open: Allows reading of information on setup function
  delay(200);
  
  SST sst = SST('F', 4); // A3 is F4
  setupMemory(sst);
  delay(100);

  sst.flashTotalErase();

  /**********************************************************************************************
   * CONFIGURATION AND STATUS REGISTER                                                          *
   *                                                                                            *
   * Upon initialization of SST, the status register should display 0000000 as the device is    *
   * neither write enabled nor busy.                                                            *
   * The config register is set to be 00001010, so as to have WP# and HOLD# disabled.           *
   **********************************************************************************************/

  /*
  Serial.println("------------------------------------------------------------");
  Serial.println("TESTING CONFIGURATION AND STATUS REGISTER");
  Serial.println("------------------------------------------------------------\n");

  Serial.print("CONFIG REGISTER : ");
  sst.printConfigRegister(&Serial); // Expected 00001010
  Serial.print("STATUS REGISTER : ");
  sst.printStatusRegister(&Serial); // Expected 00000000
  
  Serial.println("\n------------------------------------------------------------");
  Serial.println("TEST DONE");
  Serial.println("------------------------------------------------------------\n");
  */

  /**************************************************************************************************
   * READ AND WRITE LINE                                                                            *
   *                                                                                                *
   * Test to check both reading and writing on the SST.                                             *
   * At first, the SST should be empty, so the first line should display a constant string of FF    *
   * Then, we write the second sequence on the flash drive                                          *
   * Finally, the read sequence should correspond to the written sequence.                          *
   **************************************************************************************************/

  /*
  Serial.println("------------------------------------------------------------");
  Serial.println("TESTING READING AND WRITING");
  Serial.println("------------------------------------------------------------\n");
  
  for (long i=0; i<64*2; i++) {
    if (i%LINE_SIZE==0)
    {
      printLine(i,sst); delay(50);
      writeLine(i,sst); delay(50);
      printLine(i,sst); delay(50);
      Serial.print("\n");
    }
  }
  Serial.println("------------------------------------------------------------");
  Serial.println("TEST DONE");
  Serial.println("------------------------------------------------------------\n");
  */

  /**************************************************************************************************
   * PRINT NON EMPTY SECTORS AND SECTOR ERASE                                                       *
   *                                                                                                *
   * Sectors 1,2 and 3 are non empty.                                                               *
   * First, expected to display sectors 1, 2 and 3. We then erase sector 3.                         *
   * Second, expected to display 1 and 2. We then do a total erase of the chip.                     *
   * Third, expected no non-empty sectors display                                                   *
   *                                                                                                *
   * This test may take some time as PrintNonEmptySectors requires time to go through the memory    *
   **************************************************************************************************/

  /*
  writeNonDisplayed(10, sst);     // Writing a line in sector 1
  writeNonDisplayed(5000, sst);   // Writing a line in sector 2
  writeNonDisplayed(10000, sst);  // Writing a line in sector 3

  Serial.println("------------------------------------------------------------");
  Serial.println("TESTING ERASING AND CHECKING FOR EMPTY SECTORS"); 
  Serial.println("------------------------------------------------------------\n");
  
  Serial.println("NON EMPTY SECTORS (THIS MAY TAKE SOME TIME)");
  sst.printNonEmptySector(&Serial); // EXPECTED : 1,2,3
  Serial.println("ERASING SECTOR 3");
  sst.flashSectorErase(2);
  Serial.println("NON EMPTY SECTORS (THIS MAY TAKE SOME TIME)");
  sst.printNonEmptySector(&Serial); // EXPECTED : 1,2
  Serial.println("ERASING CHIP COMPLETELY");
  sst.flashTotalErase();
  Serial.println("NON EMPTY SECTORS (THIS MAY TAKE SOME TIME)");
  sst.printNonEmptySector(&Serial); // EXPECTED : Empty memory

  Serial.println("\n------------------------------------------------------------");
  Serial.println("TEST DONE");
  Serial.println("------------------------------------------------------------\n");
  */
  
  /****************************************************************************************************************
   * BLOCK PROTECTION SETTINGS                                                                                    *
   *                                                                                                              *
   * 1/ Block protection should be disabled at start and it would allow writing on the memory                     *
   * 2/ Block protection is changed to prevent writing on the memory. Writing shouldn't be functionnal anymore    *
   * 3/ Block protection is disabled again. Writing should be enabled again.                                      *
   ****************************************************************************************************************/

  /*
  Serial.println("------------------------------------------------------------");
  Serial.println("TESTING BLOCK PROTECTION SETTINGS");
  Serial.println("------------------------------------------------------------\n");

  // UNPROTECTED MEMORY
  Serial.println("UNPROTECTED MEMORY\n");
  Serial.println("READING BPR");
  sst.flashReadBPR(&Serial);
  Serial.println("WRITING LINE");
  printLine(0,sst); delay(50);
  writeLine(0,sst); delay(50);
  printLine(0,sst); delay(50);
  sst.flashSectorErase(0);

  // CHANGING PROTECTION
  uint8_t BPR[18];
  BPR[0] = 0x55;  // First 2 bytes have Read-lock. Only write lock to be enabled
  BPR[1] = 0x55;  
  for(uint8_t i=2; i<18; i++) BPR[i] = 0xFF ;
  Serial.println("\nCHANGING BLOCK PROTECTION\n"); 
  sst.flashWriteBPR(BPR,sizeof(BPR));
  Serial.println("READING BPR");
  sst.flashReadBPR(&Serial);
  Serial.println("WRITING LINE");
  printLine(0,sst); delay(50);
  writeLine(0,sst); delay(50);
  printLine(0,sst); delay(50);
  sst.flashSectorErase(0); 

  // REMOVING PROTECTION
  Serial.println("\nREMOVING BLOCK PROTECTION\n");
  sst.flashClearBPR();
  Serial.println("READING BPR");
  sst.flashReadBPR(&Serial);
  Serial.println("WRITING LINE");
  printLine(0,sst); delay(50);
  writeLine(0,sst); delay(50);
  printLine(0,sst); delay(50);
  sst.flashSectorErase(0);

  Serial.println("\n------------------------------------------------------------");
  Serial.println("TEST DONE");
  Serial.println("------------------------------------------------------------\n");
  */
}

// ======================================================================================= //



void loop()
{

}


void printLine(long address, SST& sst) {

  Serial.print("Read Address: ");
  Serial.print(address);
  Serial.print(" : ");
  sst.flashReadInit(address);
  for (uint8_t j = 0; j < LINE_SIZE; j++) {
    uint8_t oneByte = sst.flashReadNextInt8();
    Serial.print(oneByte, HEX);
    Serial.print(" ");
    address++;
  }
  sst.flashReadFinish();
  Serial.println("");
}

void writeLine(long address, SST& sst) {

  Serial.print("Write Address: ");
  Serial.print(address);
  Serial.print(" : ");
  sst.flashWriteInit(address);
  delay(100);
  for (uint8_t j = 0; j < LINE_SIZE; j++) {
    sst.flashWriteNextInt8(j);
    Serial.print(j, HEX);
    Serial.print(" ");
    address++;
  }
  sst.flashWriteFinish();
  Serial.println("");
}

void writeNonDisplayed(long address, SST& sst) {

  sst.flashWriteInit(address);
  delay(100);
  for (uint8_t j = 0; j < LINE_SIZE; j++) {
    sst.flashWriteNextInt8(j);

    address++;
  }
  sst.flashWriteFinish();
}

void setupMemory(SST& sst) {
  SPI.begin();
  SPI.setDataMode(SPI_MODE0);
  SPI.setBitOrder(MSBFIRST);
  sst.init();
}














