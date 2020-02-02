#include <TimerOne.h>

const int direction = 8;
const int pin = 9;

void setup(void)
{
  pinMode(direction, OUTPUT);
  Timer1.initialize(5000);  // 5000ms  = 40 Hz
  Timer1.pwm(pin, 512); // second parameter is duty from 0 to 1023
}

void loop(void) {
  digitalWrite(direction, HIGH);

 Timer1.setPeriod(5000); // 5000 is 1 rotation per seconds
 delay(1000000);
  
  byte rpm = 60;
  Timer1.setPeriod((50 * 60 / rpm) * 100); // 5000 is 1 rotation per seconds
  delay(100000);
}



