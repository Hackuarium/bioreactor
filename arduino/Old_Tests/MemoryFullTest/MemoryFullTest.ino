#include "MemoryFullTest.h"
/*********
 * SETUP
 *********/
void setup() {
  delay(1000); 
  Serial.begin(9600);
  delay(11000);
  setupParameters(); 

  #ifdef FLASH_SELECT 
    pinMode(FLASH_SELECT,OUTPUT);
  setupMemory();
  recoverLastEntryN();
  loadLastEntryToParameters();   //get back the previous config  
  #endif

  nilSysBegin();
}

void loop() {}


//Global Thread Locking
bool lockTimeCriticalZone=false;
void protectThread() {
   while(lockTimeCriticalZone) {
    nilThdSleepMilliseconds(5);
   }
   lockTimeCriticalZone=true;
}

void unprotectThread() {
	lockTimeCriticalZone=false;
}

