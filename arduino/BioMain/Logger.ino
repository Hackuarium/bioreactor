// #define DEBUG_MEMORY    // takes huge amount of memory should not be activated !!

/*****************************************************************************************
  This thread takes care of the logs and manage the time and its synchronisation
  The thread write the logs at a definite fixed interval of time in the SST25VF064 chip
  The time synchronization works through the NTP protocol and our server
******************************************************************************************/

#ifdef THR_LINEAR_LOGS

#include <SST.h>

/******************************************
   DEFINE FLASH VERSION (default is SST64)
 *****************************************/
//  THIS SHOULD BE AUTOMATIC !!!
//support SST25VF064C, SST26VF064B (64Mbits) or similar from Cypress
#define SST64 1
//support SST25VF032C, SST26VF032B (32Mbits) or similar from Cypress
//#define SST32 1

#if defined(SST64) || defined(SST32)



//Types of logs
#define ENTRY_SIZE_LINEAR_LOGS     64
#define SIZE_TIMESTAMPS            4
#define SIZE_COUNTER_ENTRY         4

// Definition of the log sectors in the flash for the logs
#if defined(SST64) //64Mbits
#define ADDRESS_MAX   0x800000 // http://www.sst.com/dotAsset/40498.pdf&usd=2&usg=ALhdy294tEkn4s_aKwurdSetYTt_vmXQhw
#elif defined(SST32) //32Mbits
#define ADDRESS_MAX   0X400000
#endif

// #define ADDRESS_MAX   0X001000 // if we don't want to use all memory !!!!


#define ADDRESS_BEG   0x000000
#define ADDRESS_LAST  (ADDRESS_MAX - ENTRY_SIZE_LINEAR_LOGS)
#define SECTOR_SIZE       4096
#define NB_ENTRIES_PER_SECTOR    (SECTOR_SIZE  / ENTRY_SIZE_LINEAR_LOGS)
#define ADDRESS_SIZE  (ADDRESS_MAX  - ADDRESS_BEG)
// The number of entires by types of logs (seconds, minutes, hours, commands/events)
#define MAX_NB_ENTRIES    (ADDRESS_SIZE  / ENTRY_SIZE_LINEAR_LOGS)

#define MAX_MULTI_LOG 64 // Allows to display long log on serial


#if FLASH_SELECT == D10 //Flash SS_SPI
SST sst = SST('B', 6); //D10 is B6
#endif
#if FLASH_SELECT == A3 //Flash SS_SPI
SST sst = SST('F', 4); // A3 is F4
#endif



static uint32_t nextEntryID = 0;
boolean logActive = false;


uint32_t findAddressOfEntryN(uint32_t entryN);

/***********************************************************************************
  Save logs in the Flash memory.
  event_number: If there is a command, then this parameter should be set with the
  corresponding command/event number. Should be found in the define list of
  commands/errors
************************************************************************************/




void writeLog(uint16_t event_number, int parameter_value) {
  /********************************
             Safeguards
  ********************************/
  if (!logActive) return;
  /*****************************
            Slave Select
  ******************************/

  protectThread();

  uint16_t param = 0;
  uint32_t timenow = now();
  uint32_t startAddress = findAddressOfEntryN(nextEntryID);

  /************************************************************************************
      Test if it is the begining of one sector, erase the sector of 4096 bytes if needed  delay(2);
    ************************************************************************************/
  if ((!(nextEntryID % NB_ENTRIES_PER_SECTOR))) {
#ifdef DEBUG_LOGS
    Serial.print(F("ERASE sctr: "));
    Serial.println(findSectorOfN());
#endif
    long start = millis();
    sst.flashSectorErase(startAddress);

    /*
      Serial.print("Result of erase ");
      Serial.println(millis()-start);
      dumpLoggerFlash(&Serial, startAddress, startAddress+512);
    */
  }
  /*****************************
          Writing Sequence
  ******************************/


  sst.flashWriteInit(startAddress); // Initialize with the right address
  sst.flashWriteNextInt32(nextEntryID);      //4 bytes of the entry number
  sst.flashWriteNextInt32(timenow);            //4 bytes of the timestamp in the memory using a mask
  for (byte i = 0; i < NB_PARAMETERS_LINEAR_LOGS; i++) {
    param = getParameter(i);
    sst.flashWriteNextInt16(param);          //2 bytes per parameter
  }
  sst.flashWriteNextInt16(event_number);    //event
  sst.flashWriteNextInt16(parameter_value); //parameter value */
  sst.flashWriteFinish();                   // finish the writing process


  /*****************************
          Check saved information
          We assume that the logger is high priority
          And no other thread will change any of the values !!!!!!
  ******************************/
  boolean isLogValid = true;
  sst.flashReadInit(findAddressOfEntryN(nextEntryID));
  if (sst.flashReadNextInt32() != nextEntryID) isLogValid = false;
  if (sst.flashReadNextInt32() != timenow) isLogValid = false;
  for (byte i = 0; i < NB_PARAMETERS_LINEAR_LOGS; i++) {
    if (sst.flashReadNextInt16() != getParameter(i)) isLogValid = false;
  }
  if (sst.flashReadNextInt16() != event_number) isLogValid = false;
  if (sst.flashReadNextInt16() != parameter_value) isLogValid = false;
  sst.flashReadFinish();

#ifdef DEBUG_LOGS
  Serial.println(F("nextEntryID "));
  Serial.println(nextEntryID);
  Serial.println(F("writtenID "));
  Serial.println(writtenID);
#endif

  if (isLogValid) {
    //Update the value of the next event log position in the memory
    nextEntryID++;
#ifdef DEBUG_LOGS
    Serial.print(F("OK"));
#endif
  } else {
    Serial.print(F("Log fail "));
    Serial.println(nextEntryID);
    // if logger fails it is better to go back and erase the full sector
    // we can anyway not try to write if it was not erased !
    // and if we don't do this ... we will destroy the memory !
    nextEntryID -= nextEntryID % NB_ENTRIES_PER_SECTOR;
  }

  /*****************************
         Out and Deselect
  ******************************/
  unprotectThread();
  nilThdSleepMilliseconds(5);
}

/******************************************************************************************
  Read the corresponding logs in the flash memory of the entry number (ID).
  result: Array of uint8_t where the logs are stored. It should be a 32 bytes array
  for the 3 RRD logs and 12 bytes for the commands/events logs.
  #ifdef LOG_INTERVAL
  entryN: Log ID that will correspond to the logs address to be read and stored in result
  return:  Error flag: 0: no error occured
  EVENT_ERROR_NOT_FOUND_ENTRY_N: The log ID (entryN) was not found in the flash memory
 *****************************************************************************************/
uint32_t printLogN(Print* output, uint32_t entryN) {
  // Are we asking for a log entry that is not on the card anymore ? Then we just start with the first that is on the card
  // And we skip a sector ...
  if ((nextEntryID > MAX_NB_ENTRIES) && (entryN < (nextEntryID - MAX_NB_ENTRIES + NB_ENTRIES_PER_SECTOR))) {
    entryN = nextEntryID - MAX_NB_ENTRIES + NB_ENTRIES_PER_SECTOR;
  }
  protectThread();
  sst.flashReadInit(findAddressOfEntryN(entryN));
#ifdef DEBUG_LOGS
  Serial.print(F("entryN: "));
  Serial.println(entryN);
#endif
  byte checkDigit = 0;
  for (byte i = 0; i < ENTRY_SIZE_LINEAR_LOGS; i++) {
    byte oneByte = sst.flashReadNextInt8();
    checkDigit ^= toHex(output, oneByte);
  }
  checkDigit ^= toHex(output, (int)getQualifier());
  toHex(output, checkDigit);
  output->println("");
  sst.flashReadFinish();
  unprotectThread();
  return entryN;
}


void Last_Log_To_SPI_buff(byte* buff) {
  protectThread();
  sst.flashReadInit(findAddressOfEntryN(nextEntryID - 1));
  for (byte i = 0; i < ENTRY_SIZE_LINEAR_LOGS; i++) {
    byte oneByte = sst.flashReadNextInt8();
    buff[i] = oneByte;
  }
  sst.flashReadFinish();
  unprotectThread();
}


uint8_t loadLastEntryToParameters() {
  uint32_t addressOfEntryN = findAddressOfEntryN(nextEntryID - 1);
  sst.flashReadInit(addressOfEntryN + 8); // we skip entryID and epoch
  for (byte i = 0; i < NB_PARAMETERS_LINEAR_LOGS; i++) {
    setParameter(i, sst.flashReadNextInt16());
  }
  sst.flashReadFinish();
}


/******************************************************************************
  Returns the address corresponding to one log ID nilThdSleepMilliseconds(5); nilThdSleepMilliseconds(5);
  entryNb:     Log ID
  return:      Address of the first byte where the corresponding log is located
*******************************************************************************/
uint32_t findAddressOfEntryN(uint32_t entryN)
{
  uint32_t address = ((entryN % MAX_NB_ENTRIES) * ENTRY_SIZE_LINEAR_LOGS) % ADDRESS_SIZE + ADDRESS_BEG;
  return address;
}

/*****************************************************************************
  Returns the last log ID stored in the memory
  return: Last log ID stored in the memory corresponding to a log type
******************************************************************************/
void recoverLastEntryN()
{
  uint32_t ID_temp = 0;
  uint32_t Time_temp = 0;
  uint32_t addressEntryN = ADDRESS_BEG;
  boolean found = false;

#ifdef DEBUG_LOGS
  Serial.print(F("1st addr: "));
  Serial.println(ADDRESS_BEG);
  Serial.print(F("Max addr: "));
  Serial.println(ADDRESS_LAST);
#endif

  while (addressEntryN < ADDRESS_LAST)
  {
    sst.flashReadInit(addressEntryN);
    ID_temp = sst.flashReadNextInt32();
    Time_temp = sst.flashReadNextInt32();
    sst.flashReadFinish();

#ifdef DEBUG_LOGS
    Serial.print(F("ID_tmp: "));
    Serial.println(ID_temp);
    Serial.print(F("nextEntryID: "));
    Serial.println(nextEntryID);
#endif

    // Test if first memory slot contains any information
    if ((ID_temp == 0xFFFFFFFF) || (ID_temp < nextEntryID))
    {
      break;
    }
    addressEntryN += ENTRY_SIZE_LINEAR_LOGS;
    nextEntryID = ID_temp + 1; // this will be the correct value in case of break
    setTime(Time_temp);

    // we implement a quick advance
    if (addressEntryN < (ADDRESS_LAST - 128 * ENTRY_SIZE_LINEAR_LOGS)) {
      sst.flashReadInit(addressEntryN + (128 * ENTRY_SIZE_LINEAR_LOGS));
      ID_temp = sst.flashReadNextInt32();
      sst.flashReadFinish();
      if (ID_temp >= nextEntryID && ID_temp != 0xFFFFFFFF) {
        addressEntryN += 127 * ENTRY_SIZE_LINEAR_LOGS;
      }
    }

#ifdef DEBUG_LOGS
    Serial.print(F("Current nextEntryID:"));
    Serial.println(nextEntryID);
#endif
  }
#ifdef DEBUG_LOGS
  Serial.print(F("Final nextEntryID:"));
  Serial.println(nextEntryID);
#endif
  logActive = true;
}

/*****************************
  Memory related functions
 *****************************/
//Setup the memory for future use
//Need to be used only once at startup
void setupMemory() {
  SPI.begin();
  SPI.setDataMode(SPI_MODE0);
  SPI.setBitOrder(MSBFIRST);
  sst.init();
}

void printLastLog(Print* output) {
  printLogN(output, nextEntryID - 1);
}

void formatFlash(Print* output) {
  protectThread();
  sst.flashTotalErase();
  output->println(F("OK"));
  nextEntryID = 0;
  unprotectThread();
}


void testFlash(Print* output) {
  wdt_disable();
  protectThread();
  output->println(F("Write / read / validate"));
  for (int i = 0; i < ADDRESS_MAX / SECTOR_SIZE; i++) {
    for (byte j = 0; j < SECTOR_SIZE / 64; j++) {
      long address = (long)i * SECTOR_SIZE + (long)j * 64;
      sst.flashWriteInit(address);
      byte result = 0;
      for (byte k = 0; k < 64; k++) {
        result ^= (k + 13);
        sst.flashWriteNextInt8(k + 13);
      }
      sst.flashWriteFinish();
      sst.flashReadInit(address);
      for (byte k = 0; k < 64; k++) {
        result ^= sst.flashReadNextInt8();
      }
      sst.flashReadFinish();
      if (result == 0) {
        if (j == 0 && i % 16 == 0) {
          output->print(F("."));
        }
        if (j == 0 && i % 1024 == 1023) {
          output->println(F(""));
        }
      } else {
        output->println(address);
      }
    }
  }
  unprotectThread();
  wdt_enable(WDTO_8S);
  wdt_reset();
}

void readFlash(Print* output, long firstRecord) {
  protectThread();
  output->println(F("Index / Address / ID / Epoch"));
  for (int i = firstRecord; i < ADDRESS_MAX / SECTOR_SIZE; i++) {
    if (i == (firstRecord + 256)) break;
    long address = findAddressOfEntryN(i);
    sst.flashReadInit(address);
    output->print(i);
    output->print(" ");
    output->print(address, HEX);
    output->print(" ");
    output->print(sst.flashReadNextInt32(), HEX);
    output->print(" ");
    output->print(sst.flashReadNextInt32(), HEX);
    output->println("");
    sst.flashReadFinish();
  }
  unprotectThread();
}

/*
   We will check when we have a change to FF at the ID
*/

void debugFlash(Print* output) {
  wdt_disable();
  protectThread();
  output->print(F("Debug changes"));
  byte isFF = 2;
  for (long i = 0; i < MAX_NB_ENTRIES; i++) {
    long address = findAddressOfEntryN(i);
    sst.flashReadInit(address);
    long index = sst.flashReadNextInt32();
    if (index == 0xFFFFFFFF) {
      if (isFF != 1) {
        isFF = 1;
        output->println(F(""));
        output->print(i);
        output->print(F(" "));
        toHex(output, index);

      }
    } else {
      if (isFF != 0) {
        isFF = 0;
        output->println(F(""));
        output->print(i);
        output->print(F(" "));
        toHex(output, index);
      }
    }
    sst.flashReadFinish();
    if (i % 1024 == 0) {
      output->print(F("."));
    }
  }
  output->println(F(""));
  output->println(F("Done"));
  unprotectThread();
  wdt_enable(WDTO_8S);
  wdt_reset();
}

/*
   We will check when we have a change to FF at the ID
*/
void checkNextID(Print* output) {
  wdt_disable();
  protectThread();
  output->println(F("Check next ID"));
  // we assume that the ID should always grow linearly. Just
  // after it is not linear, we set the lastEntryID
  sst.flashReadInit(0);
  uint32_t expectedID = sst.flashReadNextInt32();
  sst.flashReadFinish();
  for (uint32_t i = 1; i < MAX_NB_ENTRIES; i++) {
    expectedID++;
    uint32_t address = findAddressOfEntryN(i);
    sst.flashReadInit(address);
    uint32_t currentID = sst.flashReadNextInt32();
    sst.flashReadFinish();
    if (currentID != expectedID && currentID != 4294967295) {
      output->print(expectedID);
      output->print(" ");
      output->println(currentID);
    }
  }
  unprotectThread();
  wdt_enable(WDTO_8S);
  wdt_reset();
  output->println(F("Done"));
}

#ifdef LOG_INTERVAL

#ifdef DEBUG_LOGS
NIL_WORKING_AREA(waThreadLogger, 128);
#else
NIL_WORKING_AREA(waThreadLogger, 64);
#endif

NIL_THREAD(ThreadLogger, arg) {
  nilThdSleepMilliseconds(5000);
  writeLog(EVENT_ARDUINO_BOOT, 0);
  while (TRUE) {
    //avoids logging during the second x+1, ensure x+LOG_INTERVAL
    //because epoch is only precise to the second so the logging is evenly spaced
    nilThdSleepMilliseconds(LOG_INTERVAL * 1000 - millis() % 1000 + 100);
    //    nilThdSleepMilliseconds(50);
    writeLog(0, 0);
  }
}

#endif


void processLoggerCommand(char command, char* data, Print* output) {
  switch (command) {
#ifdef DEBUG_MEMORY
    case 'c':
      checkNextID(output);
      break;
    case 'd':
      debugFlash(output);
      break;
#endif
    case 'f':
      if (data[0] == '\0' || atoi(data) != 1234) {
        output->println(F("To format flash enter lf1234"));
      } else {
        formatFlash(output);
      }
      break;
    case 'i':
      sst.printFlashID(output);
      break;
    case 'l':
      if (data[0] != '\0')
        printLogN(output, atol(data));
      else
        printLastLog(output);
      break;
    case 'm':
      if (data[0] != '\0') {
        long currentValueLong = atol(data);
        if (( currentValueLong - nextEntryID ) < 0) {
          printLogN(output, currentValueLong);
        }
        else {
          byte endValue = MAX_MULTI_LOG;
          if (currentValueLong > nextEntryID)
            endValue = 0;
          else if (( nextEntryID - currentValueLong ) < MAX_MULTI_LOG)
            endValue = nextEntryID - currentValueLong;
          for (byte i = 0; i < endValue; i++) {
            currentValueLong = printLogN(output, currentValueLong) + 1;
            nilThdSleepMilliseconds(25);
          }
        }
      }
      else {
        output->println(nextEntryID - 1);
      }
      break;
#ifdef DEBUG_MEMORY
    case 'n':
      if (data[0] == '\0' || atoi(data) < NB_ENTRIES_PER_SECTOR || atoi(data) % NB_ENTRIES_PER_SECTOR) {
        output->print(F("Must be a multiple of "));
        output->println(NB_ENTRIES_PER_SECTOR);
      } else {
        nextEntryID = atoi(data);
      }
      break;
#endif
    case 'r':
      if (data[0] == '\0') {
        readFlash(output, 0);
      } else {
        readFlash(output, atol(data));
      }
      break;
    case 't':
      if (data[0] == '\0' || atoi(data) != 1234) {
        output->println(F("YOU LOOSE ALL DATA! Use lt1234"));
      } else {
        testFlash(output);
      }
      break;
    default:
      printLoggerHelp(output);
  }

}



void printLoggerHelp(Print* output) {
  output->println(F("Logger help"));
#ifdef DEBUG_MEMORY
  output->println(F("(lc) Check"));
  output->println(F("(ld) Debug"));
  output->println(F("(ln) Set nextID"));
#endif
  output->println(F("(lf) Format"));
  output->println(F("(li) Info"));
  output->println(F("(ll) Current log"));
  output->println(F("(lm) Multiple log"));
  output->println(F("(lr) Read (start record)"));
  output->println(F("(lt) Test"));

}

void dumpLoggerFlash(Print* output, uint32_t fromAddress, uint32_t toAddress) {
  int bytesPerRow = 16;
  int j = 0;
  char buf[4];
  sst.flashReadInit(fromAddress);
  // go from first to last eeprom address
  for (uint32_t i = fromAddress; i <= toAddress; i++) {
    if (j == 0) {
      sprintf(buf, "%03X", i);
      output->print(buf);
      output->print(F(": "));
    }
    sprintf(buf, "%02X ", sst.flashReadNextInt8());
    j++;
    if (j == bytesPerRow) {
      j = 0;
      output->println(buf);
      nilThdSleepMilliseconds(25);
    }
    else {
      output->print(buf);
    }
  }
  sst.flashReadFinish();
}

#endif
#endif














