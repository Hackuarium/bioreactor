
// THIS TEST CONTAINS THREE METHODS TO MOVE THE STEPPER
// THE METHODS ARE ALL FUNCTIONNAL
// ONLY ONE METHOD SHOULD BE UNCOMMENTED AT ONE TIME

  /***********************************************************
   * When using the DRV8811, we move the motor using steps.  *
   * If we define a step as either turning the motor pin on  *
   * or off : One full rotation is obtained after 3200 steps *
   *                                                         *
   * Each step contains a delay. This delay is calculated    *
   * from the desired RPM (chosen by user)                   *
   ***********************************************************/

  // Desired velocity (in RPM)
  uint16_t velocity(60);

//----------- PARAMETERS DEPENDING ON PAD SHORTAGES -----------//

// NO PAD SHORTED
/*
  // The stepper motor recquires 3200 steps in order to do a full rotation
  // (this means 3200 delays)
  uint16_t stepsPerRotation = 3200;
  uint16_t numberSteps(stepsPerRotation);
  
  // Ratio to convert the amount of rotations per minute into the interval between each step
  // = 6e7 [us/min] / 3200 [step/rotation] --> divided by RPM --> [us/step]
  uint16_t RPMToStep = 18750;
  uint16_t delayPerStep = RPMToStep/velocity;
*/

// PAD 1 (CLOSEST TO DRIVER) SHORTED
/*
  // The stepper motor recquires 1600 steps in order to do a full rotation
  // (this means 1600 delays)
  uint16_t stepsPerRotation = 1600;
  uint16_t numberSteps(stepsPerRotation);
  
  // Ratio to convert the amount of rotations per minute into the interval between each step
  // = 6e7 [us/min] / 1600 [step/rotation] --> divided by RPM --> [us/step]
  uint16_t RPMToStep = 37500;
  uint16_t delayPerStep = RPMToStep/velocity;
*/

// PAD 2 (FURTHEST TO DRIVER) SHORTED
/*
  // The stepper motor recquires 800 steps in order to do a full rotation
  // (this means 800 delays)
  uint16_t stepsPerRotation = 800;
  uint16_t numberSteps(stepsPerRotation);
  
  // Ratio to convert the amount of rotations per minute into the interval between each step
  // = 6e7 [us/min] / 800 [step/rotation] --> divided by RPM --> [us/step]
  uint32_t RPMToStep = 75000;                 // uint16_t is not enough anymore
  uint32_t delayPerStep = RPMToStep/velocity;
*/

// PADS 1 AND 2 SHORTED

  // The stepper motor recquires 400 steps in order to do a full rotation
  // (this means 400 delays)
  uint16_t stepsPerRotation = 400;
  uint16_t numberSteps(stepsPerRotation);
  
  // Ratio to convert the amount of rotations per minute into the interval between each step
  // = 6e7 [us/min] / 400 [step/rotation] --> divided by RPM --> [us/step]
  uint32_t RPMToStep = 150000;                 // uint16_t is not enough anymore
  uint32_t delayPerStep = RPMToStep/velocity;


//----------- METHOD WITH DIRECT PORT MANIPULATION -----------//

// Allows perfect control of the stepper speed
// Requires delays of several microseconds only

void setup() {
  // Turns pins 8 and 9 as output. Pins 8 and 9 are Port B 4 and 5
  DDRB |= 48;  // 48 = B00110000
  PORTB &= ~(_BV(4)); // Turns pin 8 as LOW
}

void loop() {
  while(numberSteps > 0){
    numberSteps--;
      
    PORTB ^= (_BV(5));    // Toggle value of pin 9
    delayMicroseconds(delayPerStep);
  }
  
  //delay(1500);  // Pause between each full rotation of the motor
  numberSteps = stepsPerRotation;
  //PORTB ^= (_BV(4));  // Inverts value of pin 8: Flips direction of the motor    
}


//----------- METHOD WITH ANALOG WRITE -----------//

// Allows to have long delays between each call to the function analogWrite
// On the other hand, it makes it much more difficult to change the stepper speed

/*
void setup() {
  // Turns pins 8 and 9 as output. Pins 8 and 9 are Port B 4 and 5
  DDRB |= 48;  // 48 = B00110000
  PORTB &= ~(_BV(4)); // Turns pin 8 as LOW

  // set timer 1 divisor to 8 for PWM frequency of  3921.16 Hz
  // Increases Pins 9 and 10 frequency by a factor 8
  // IMPORTANT: The modification of this frequency causes incompatibility with Servo library from arduino
  // MORE INFO HERE : https://arduino-info.wikispaces.com/Arduino-PWM-Frequency
  // -------------- : https://playground.arduino.cc/Code/PwmFrequency
 
  TCCR1B = TCCR1B & B11111000 | B00000010; 

}

void loop() {

    analogWrite(9,128);
    delay(10000);
    //delayMicroseconds(delayPerStep); // Doesn't pause the analogWrite
}
*/

//----------- METHOD WITH DIGITAL WRITE -----------//

// Allows perfect control of the stepper speed
// Requires delays of several microseconds only

/*
void setup() {
  // put your setup code here, to run once:
  pinMode(8, OUTPUT);
  pinMode(9, OUTPUT);
  digitalWrite(8, LOW);
}

void loop() {
  // put your main code here, to run repeatedly:

  for(uint16_t i(0); i < 1600; ++i)
  // Exactly 1600 steps for one complete rotation
  // Amount of steps is divided by two compared to first test because two delays occur in one step (different definition)
  {
    digitalWrite(9, HIGH);
    delayMicroseconds(500);
    digitalWrite(9, LOW);
    delayMicroseconds(500);
  }
  delay(1500);
}
*/
