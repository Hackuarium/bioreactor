/*********************************************
   This file is used to declare the parameters
   table used by the program.

   We use the EEPROM for saving the parameters
   changed by the user during the functionment
   of the Bioreactor.

   The parameter are loaded during the boot.

   All change to important parameters are saved
   to the EEPROM
 *********************************************/

#include <avr/eeprom.h>
#include "Arduino.h"
#include <NilRTOS.h>
#include "BioMain.h"



#define MAX_PARAM 52   // If the MAX_PARAM change you need to change the pointer in the EEPROM
#define NB_PARAMETERS_LINEAR_LOGS  26



// Definition of all events to be logged
#define EVENT_ARDUINO_BOOT              1
#define EVENT_ARDUINO_SET_SAFE          2

#define EVENT_STATUS_ENABLE             3
#define EVENT_STATUS_DISABLE            4

#define EVENT_ERROR_FAILED              6
#define EVENT_ERROR_RECOVER             7




#define EVENT_MOTOR_START            20
#define EVENT_MOTOR_STOP             21


#define EVENT_ERROR_NOT_FOUND_ENTRY_N  150

#define EVENT_SAVE_ALL_PARAMETER     255
//When parameters are set (and saved) an event is recorded (256-281 : A-Z + .... (if more parameters than 262 ...)
#define EVENT_PARAMETER_SET          256




#define EE_LORA_DEVADDR          150  // 8 bytes
#define EE_LORA_NWKSKEY          158  // 32 bytes
#define EE_LORA_APPSKEY          190  // 32 bytes
#define EE_QUALIFIER             222


#define EE_START_PARAM           0 // We save the parameter from byte 0 of EEPROM
#define EE_LAST_PARAM            (MAX_PARAM*2-1) // The last parameter is stored at byte 50-51

#define EEPROM_MIN_ADDR            0
#define EEPROM_MAX_ADDR          511

// value that should not be taken into account
// in case of error the parameter is set to this value
#define ERROR_VALUE  -32768

int parameters[MAX_PARAM];

void setupParameters() {
  //We copy all the value in the parameters table
  eeprom_read_block((void*)parameters, (const void*)EE_START_PARAM, MAX_PARAM * 2);
}

int getParameter(byte number) {
  return parameters[number];
}

boolean setParameterBit(byte number, byte bitToSet) {
  if (getParameterBit(number, bitToSet)) return false;
  parameters[number]=parameters[number] | (1 << bitToSet);
  return true;
  // 
}

boolean clearParameterBit(byte number, byte bitToClear) {
  if (! getParameterBit(number, bitToClear)) return false;
  parameters[number]=parameters[number] & ( ~ (1 << bitToClear));
  // bitClear(parameters[number], bitToClear);
  return true;
}

boolean getParameterBit(byte number, byte bitToRead) {
  // return (bitRead(parameters[number], bitToRead) == 1) ? true : false;
  return (parameters[number] >> bitToRead ) & 1;
}

void setParameter(byte number, int value) {
  parameters[number] = value;
}

void saveParameters() {
  for (byte i = 0; i < MAX_PARAM; i++) {
    eeprom_write_word((uint16_t*) EE_START_PARAM + i, parameters[i]);
  }
  writeLog(EVENT_SAVE_ALL_PARAMETER, 0);
}

/*
  This will take time, around 4 ms
  This will also use the EEPROM that is limited to 100000 writes
*/
void setAndSaveParameter(byte number, int value) {
  parameters[number] = value;
  //The address of the parameter is given by : EE_START_PARAM+number*2
  eeprom_write_word((uint16_t*) EE_START_PARAM + number, value);

  writeLog(EVENT_PARAMETER_SET + number, value);
}


void printParameter(Print* output, byte number) {
  output->print(number);
  output->print("-");
  if (number > 25) {
    output->print((char)(floor(number / 26) + 64));
  } else {
    output->print(" ");
  }
  output->print((char)(number - floor(number / 26) * 26 + 65));
  output->print(": ");
  output->println(parameters[number]);
}

void printParameters(Print* output) {
  for (byte i = 0; i < MAX_PARAM; i++) {
    printParameter(output, i);
  }
}

// code from http://www.arduino.cc/playground/Code/EepromUtil
void getStatusEEPROM(Print* output) {
  int bytesPerRow = 16;
  int i;
  int j;
  byte b;
  char buf[4];

  j = 0;

  // go from first to last eeprom address
  for (i = EEPROM_MIN_ADDR; i <= EEPROM_MAX_ADDR; i++) {
    if (j == 0) {
      sprintf(buf, "%03X", i);
      output->print(buf);
      output->print(F(": "));
    }

    // read current byte from eeprom
    b = eeprom_read_byte(i);
    sprintf(buf, "%02X ", b);
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
}


uint8_t printCompactParameters(Print* output) {
  printCompactParameters(output, MAX_PARAM);
}

uint8_t printCompactParameters(Print* output, byte number) {
  if (number > MAX_PARAM) {
    number = MAX_PARAM;
  }
  byte checkDigit = 0;

  // we first add epoch
  checkDigit ^= toHex(output, (long)now());
  for (int i = 0; i < number; i++) {
    int value = getParameter(i);
    checkDigit ^= toHex(output, value);
  }
  checkDigit ^= toHex(output, (int)getQualifier());
  toHex(output, checkDigit);
  output->println("");
}

/* The qualifier represents the card ID and is stored just after the last parameter */
uint16_t getQualifier() {
  return eeprom_read_word((uint16_t*)(EE_QUALIFIER));
}

void setQualifier(uint16_t value) {
  eeprom_write_word((uint16_t*)(EE_QUALIFIER), value);
}


// this method will check if there was a change in the error status and log it in this case
boolean saveAndLogError(boolean isError, byte errorFlag) {
  if (isError) {
    if (setParameterBit(PARAM_ERROR, errorFlag)) { // the status has changed
#ifdef EVENT_LOGGING
      writeLog(EVENT_ERROR_FAILED, errorFlag);
#endif
      return true;
    }
  } else {
    if (clearParameterBit(PARAM_ERROR, errorFlag)) { // the status has changed
#ifdef EVENT_LOGGING
      writeLog(EVENT_ERROR_RECOVER, errorFlag);
#endif
      return true;
    }
  }
  return false;
}

boolean isError(int filter) {
  if ((getParameter(PARAM_ERROR) & filter) != 0) return true;
  return false;
}

boolean isError() {
  return (getParameter(PARAM_ERROR)!= 0);
}

boolean getStatus(byte statusFlag) {
  return getParameterBit(PARAM_STATUS, statusFlag);
}

boolean isEnabled(byte statusFlag) {
  return getParameterBit(PARAM_ENABLED, statusFlag);
}

boolean isRunning(byte statusFlag) {
  return getParameterBit(PARAM_STATUS, statusFlag);
}


boolean start(byte statusFlag) {
  boolean statusChanged = setParameterBit(PARAM_STATUS, statusFlag);
#ifdef EVENT_LOGGING
  if (statusChanged) {
    writeLog(EVENT_STATUS_ENABLE, statusFlag);
  }
#endif
  return statusChanged;
}

boolean stop(byte statusFlag) {
  boolean statusChanged =  clearParameterBit(PARAM_STATUS, statusFlag);
#ifdef EVENT_LOGGING
  if (statusChanged) {
    writeLog(EVENT_STATUS_DISABLE, statusFlag);
  }
#endif
  return statusChanged;
}



