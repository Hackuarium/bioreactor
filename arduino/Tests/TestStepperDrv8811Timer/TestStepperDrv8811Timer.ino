#include "TimerOne.h"

const int directionPin = 8;
byte direction = 0;
const int pin = 9;


// NO PAD SHORTED
// The stepper motor recquires 3200 steps in order to do a full rotation



void setup(void)
{
  pinMode(directionPin, OUTPUT);
  Timer1.initialize(312); //  1 tour per second
  Timer1.pwm(pin, 512); // second parameter is duty from 0 to 1023
}

void loop(void) {
  direction = direction == 0 ? direction = 1 : direction = 0;
  Timer1.start();
  
  digitalWrite(directionPin, direction);

  // Timer1.setPeriod(5000);
  delay(5000);

  Timer1.stop();
  delay(1000);

}
