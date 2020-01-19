#include <NilRTOS.h>


SEMAPHORE_DECL(lockTimeCriticalZone, 1);

void setup() {
  Serial.begin(9600);
}

// the loop function runs over and over again forever
void loop() {

	nilSysBegin();

}
