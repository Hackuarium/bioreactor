#include <LiquidCrystal.h>
// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(10,9,8,6,12,A6);

#define ENCODER_CLOCKWISE 0
#define ENCODER_ANTI_CLOCKWISE 1
#define ENCODER_BUTTON 7
#define INT_CLOCKWISE 2
#define INT_ANTI_CLOCKWISE 3
#define INT_BUTTON 4


volatile unsigned int encoderPos = 0;  // a counter for the dial
unsigned int lastReportedPos = 1;   // change management
static boolean rotating=false;      // debounce management

// interrupt service routine vars
boolean A_set = false;              
boolean B_set = false;


void setup() {

  pinMode(ENCODER_CLOCKWISE, INPUT); 
  pinMode(ENCODER_ANTI_CLOCKWISE, INPUT); 
  pinMode(ENCODER_BUTTON, INPUT);
 // turn on pullup resistors
  digitalWrite(ENCODER_CLOCKWISE, HIGH);
  digitalWrite(ENCODER_ANTI_CLOCKWISE, HIGH);
  digitalWrite(ENCODER_BUTTON, HIGH);

  attachInterrupt(INT_CLOCKWISE, doEncoderA, CHANGE);
  attachInterrupt(INT_ANTI_CLOCKWISE, doEncoderB, CHANGE);
  attachInterrupt(INT_BUTTON, doEncoderButton, CHANGE);

  Serial.begin(9600);  // output
}

// main loop, work is done by interrupt service routines, this one only prints stuff
void loop() { 
  rotating = true;  // reset the debouncer

  if (lastReportedPos != encoderPos) {
    lcd.begin(20, 4);
    lcd.print("Index:");
    lcd.print(encoderPos, DEC);
    lastReportedPos = encoderPos;
    lcd.blink();
  }

}

// Interrupt on A changing state
void doEncoderA(){
  if ( rotating ) delay (1);  //debounce
  if( digitalRead(ENCODER_CLOCKWISE) != A_set ) {  // debounce once more
    A_set = !A_set;
    if ( A_set && !B_set ) 
      encoderPos += 1;
    rotating = false;  // no more debouncing until loop() hits again
  }
}

// Interrupt on B changing state, same as A above
void doEncoderB(){
  if ( rotating ) delay (1);
  if( digitalRead(ENCODER_ANTI_CLOCKWISE) != B_set ) {
    B_set = !B_set;
    //  adjust counter - 1 if B leads A
    if( B_set && !A_set ) 
      encoderPos -= 1;

    rotating = false;
  }
}

// Interrupt on B changing state, same as A above
void doEncoderButton(){
    encoderPos = 0;
}


