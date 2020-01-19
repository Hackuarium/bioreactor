#include "BioMain.h"
/*********
   SETUP
 *********/
void setup() {
  delay(1000);
  Serial.begin(9600);
  delay(1000);
  setupParameters();

#ifdef FLASH_SELECT
  pinMode(FLASH_SELECT, OUTPUT);
  setupMemory();
  recoverLastEntryN();
  loadLastEntryToParameters();   //get back the previous config
#endif

#ifdef LCD_SELECT              //disable SPI modules 
  setupLCD();
#endif

  nilSysBegin();
}

void loop() {}


//Global Thread Locking
bool lockTimeCriticalZone = false;
void protectThread() {
  while (lockTimeCriticalZone) {
    nilThdSleepMilliseconds(5);
  }
  lockTimeCriticalZone = true;
}

void unprotectThread() {
  lockTimeCriticalZone = false;
}

