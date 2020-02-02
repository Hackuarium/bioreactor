#include <NilRTOS.h>


boolean lockTimeCriticalZone=false;
int waitTime=100;


void setup() {
  Serial.begin(9600);
    delay(1000);
  Serial.println("Start");
  
	nilSysBegin();
}

// the loop function runs over and over again forever
void loop() {

}


void waitLock() {
   while(lockTimeCriticalZone) {
    nilThdSleepMilliseconds(5);
   }
   lockTimeCriticalZone=true;
   
}
