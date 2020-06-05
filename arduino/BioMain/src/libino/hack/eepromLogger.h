#ifdef THR_EEPROM_LOGGER

// part of the EEPROM is for the log
// we should be able to save and reload the log


// log is saved in the format ID / in1 / out1 / ... / in8 / out8
// ID is a sequential number
// We expect to add an entry every hour

const byte LOG_ENTRY_LENGTH = (NUMBER_PARAMETERS_TO_LOG+2)*2;
const byte NUMBER_LOGS = 960/LOG_ENTRY_LENGTH;

#define FIRST_ADDRESS   64
#define LAST_ADDRESS   1023

unsigned long lastLog = millis();
uint16_t eepromLoggerID = 0;
uint16_t eepromLoggerTimeBetween = 0;

int getFirstAddress(uint16_t entryID) {
  return FIRST_ADDRESS + LOG_ENTRY_LENGTH * (entryID % NUMBER_LOGS);
}

void writeLog() {
  int16_t firstAddress = getFirstAddress(eepromLoggerID);
  eeprom_write_word((uint16_t*)  firstAddress, eepromLoggerID);
  firstAddress+=2;
  eeprom_write_word((uint16_t*)  firstAddress, eepromLoggerTimeBetween);
  firstAddress+=2;
  for (byte i = 0; i < NUMBER_PARAMETERS_TO_LOG; i++) {
    eeprom_write_word((int16_t*)  (firstAddress + i * 2), getParameter(i));
  }
  eepromLoggerID++;
  lastLog = millis();
}

void loggerInit() {
  // we need to reload the last ID
  for (byte i = 0; i < NUMBER_LOGS; i++) {
    uint16_t entryID =  eeprom_read_word((uint16_t*) (getFirstAddress(i)));
    if (entryID > eepromLoggerID && entryID<65535) {
      eepromLoggerID=entryID;
    }
  }
  if (eepromLoggerID==0) writeLog();
  eepromLoggerID++;
}

int16_t getParameterFromLog(uint16_t entryID, byte parameter) {
  int address = getFirstAddress(entryID) + 4 + parameter * 2;
  return eeprom_read_word((int16_t*) (address));
}

void readLog(uint16_t entryID) {
  int firstAddress = getFirstAddress(entryID)+4;
  for (byte i = 0; i < NUMBER_PARAMETERS_TO_LOG; i++) {
    setParameter(i, eeprom_read_word((int16_t*) (firstAddress + i * 2)));
  }
}

void formatLog() {
  for (int i = FIRST_ADDRESS; i <= LAST_ADDRESS; i++) {
    eeprom_write_byte(i, 0xFFFF);
  }
  eepromLoggerID = 0;
  eepromLoggerTimeBetween = 0;
  writeLog();
}

uint16_t getFirstLogEntryID() {
  return NUMBER_LOGS > eepromLoggerID ? 0 : eepromLoggerID-NUMBER_LOGS;
}

uint16_t getNextLogEntryID() {
  return eepromLoggerID;
}

void printLog(Print* output) {
  int16_t first = getFirstLogEntryID();
  for (int16_t i = first; i < eepromLoggerID; i++) {
    int firstAddress = getFirstAddress(i);
    output->print(eeprom_read_word((uint16_t*) (firstAddress)));
    output->print(" ");
    firstAddress+=2;
    output->print(eeprom_read_word((uint16_t*) (firstAddress)));
    firstAddress+=2;
    for (byte j = 0; j < NUMBER_PARAMETERS_TO_LOG; j++) {
      output->print(" ");
      output->print((int)eeprom_read_word((int16_t*) (firstAddress + j * 2)));
    }
    output->println("");
  }
}

NIL_WORKING_AREA(waThreadLogger, 20);
NIL_THREAD(ThreadLogger, arg) {
  loggerInit();
  while (true) {
    nilThdSleepMilliseconds(1000);
    
    // This should deal correctly with the overflow that happens after 49.7 days
    eepromLoggerTimeBetween= (millis() - lastLog) / 1000;
    

    int delayBetweenLog = LOG_INTERVAL;
    if (delayBetweenLog < 300) delayBetweenLog = 300;

    if (eepromLoggerTimeBetween >= delayBetweenLog) {
      writeLog();
    }
  }
}

void printLoggerHelp(Print * output) {
  output->println(F("Logger help"));
  output->println(F("(ld) Dump"));
  output->println(F("(lf) Format"));
  output->println(F("(lw) Write log"));
}

void processLoggerCommand(char command, char* data, Print* output) {
  switch (command) {
    case 'd':
      printLog(output);
      break;
    case 'f':
      if (data[0] == '\0' || atoi(data) != 1234) {
        output->println(F("Format enter lf1234"));
      } else {
        output->println(F("Formatting"));
        formatLog();
        output->println("Done");
      }
      break;
    case 'l':
      break;
    case 'm':
      break;
    case 'w':
      writeLog();
      output->println(F("Log written"));
      break;
    default:
      printLoggerHelp(output);
  }
}

#endif


