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
    lcd.println("1st CALIBRATION");
    lcd.println("EMPTY TANK -> PRESS");
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

/*******Interrupt-based Rotary Encoder Menu Sketch*******/


void Menu(){                      
 LCDclear();  
 LCDserial.print("Program Menu");
 LCDsecond();    
 switch (programnumber) {                  
 case 1:                                
   LCDserial.print("Race Timer");
   LCDthird();
   LCDserial.print("Track: ");
   LCDserial.print(distance);
   LCDserial.print("m");    
   break;                              
 case 2:
   LCDserial.print("Reaction Tester");
   break;
 case 3:
   LCDserial.print("Calibration Mode");
   break;
 default:
   LCDserial.print("Race Timer");
   LCDthird();
   LCDserial.print("Track: ");
   LCDserial.print(distance);
   LCDserial.print("m");
 }

 LCDserial.print(0xFE, BYTE);
 LCDserial.print(226, BYTE);
 LCDserial.print("Next >");
 while(digitalRead(starterbutton) == HIGH){}
 delay(5);
 while(digitalRead(starterbutton) == LOW){}
 menudelaycount = 0;
   while(menudelaycount <500){
   delay(1);
   menudelaycount++;
   if(digitalRead(starterbutton) == LOW){
     programnumber++;
   if(programnumber > 3){
     programnumber = 1;
   }
   Menu();
   }
 }
 switch (programnumber) {
     case 1:
       Race();
       break;
     case 2:
       Reaction();
       break;
     case 3:
       Calibration();
       break;
     default:
       Race();
     }
}

/*******Interrupt-based Rotary Encoder Menu Sketch*******
 * by Simon Merrett, based on insight from Oleg Mazurov, Nick Gammon, rt and Steve Spence, and code from Nick Gammon
 * 3,638 bytes with debugging on UNO, 1,604 bytes without debugging
 */
// Rotary encoder declarations
static int pinA = 2; // Our first hardware interrupt pin is digital pin 2
static int pinB = 3; // Our second hardware interrupt pin is digital pin 3
volatile byte aFlag = 0; // let's us know when we're expecting a rising edge on pinA to signal that the encoder has arrived at a detent
volatile byte bFlag = 0; // let's us know when we're expecting a rising edge on pinB to signal that the encoder has arrived at a detent (opposite direction to when aFlag is set)
volatile byte encoderPos = 0; //this variable stores our current value of encoder position. Change to int or uin16_t instead of byte if you want to record a larger range than 0-255
volatile byte oldEncPos = 0; //stores the last encoder position value so we can compare to the current reading and see if it has changed (so we know when to print to the serial monitor)
volatile byte reading = 0; //somewhere to store the direct values we read from our interrupt pins before checking to see if we have moved a whole detent
// Button reading, including debounce without delay function declarations
const byte buttonPin = 4; // this is the Arduino pin we are connecting the push button to
byte oldButtonState = HIGH;  // assume switch open because of pull-up resistor
const unsigned long debounceTime = 10;  // milliseconds
unsigned long buttonPressTime;  // when the switch last changed state
boolean buttonPressed = 0; // a flag variable
// Menu and submenu/setting declarations
byte Mode = 0;   // This is which menu mode we are in at any given time (top level or one of the submenus)
const byte modeMax = 3; // This is the number of submenus/settings you want
byte setting1 = 0;  // a variable which holds the value we set 
byte setting2 = 0;  // a variable which holds the value we set 
byte setting3 = 0;  // a variable which holds the value we set 
/* Note: you may wish to change settingN etc to int, float or boolean to suit your application. 
 Remember to change "void setAdmin(byte name,*BYTE* setting)" to match and probably add some 
 "modeMax"-type overflow code in the "if(Mode == N && buttonPressed)" section*/

void setup() {
  //Rotary encoder section of setup
  pinMode(pinA, INPUT_PULLUP); // set pinA as an input, pulled HIGH to the logic voltage (5V or 3.3V for most cases)
  pinMode(pinB, INPUT_PULLUP); // set pinB as an input, pulled HIGH to the logic voltage (5V or 3.3V for most cases)
  attachInterrupt(0,PinA,RISING); // set an interrupt on PinA, looking for a rising edge signal and executing the "PinA" Interrupt Service Routine (below)
  attachInterrupt(1,PinB,RISING); // set an interrupt on PinB, looking for a rising edge signal and executing the "PinB" Interrupt Service Routine (below)
  // button section of setup
  pinMode (buttonPin, INPUT_PULLUP); // setup the button pin
  // DEBUGGING section of setup
  Serial.begin(9600);     // DEBUGGING: opens serial port, sets data rate to 9600 bps
}

void loop() {
  rotaryMenu();
  // carry out other loop code here 
}

void rotaryMenu() { //This handles the bulk of the menu functions without needing to install/include/compile a menu library
  //DEBUGGING: Rotary encoder update display if turned
  if(oldEncPos != encoderPos) { // DEBUGGING
    Serial.println(encoderPos);// DEBUGGING. Sometimes the serial monitor may show a value just outside modeMax due to this function. The menu shouldn't be affected.
    oldEncPos = encoderPos;// DEBUGGING
  }// DEBUGGING
  // Button reading with non-delay() debounce - thank you Nick Gammon!
  byte buttonState = digitalRead (buttonPin); 
  if (buttonState != oldButtonState){
    if (millis () - buttonPressTime >= debounceTime){ // debounce
      buttonPressTime = millis ();  // when we closed the switch 
      oldButtonState =  buttonState;  // remember for next time 
      if (buttonState == LOW){
        Serial.println ("Button closed"); // DEBUGGING: print that button has been closed
        buttonPressed = 1;
      }
      else {
        Serial.println ("Button opened"); // DEBUGGING: print that button has been opened
        buttonPressed = 0;  
      }  
    }  // end if debounce time up
  } // end of state change

  //Main menu section
  if (Mode == 0) {
    if (encoderPos > (modeMax+10)) encoderPos = modeMax; // check we haven't gone out of bounds below 0 and correct if we have
    else if (encoderPos > modeMax) encoderPos = 0; // check we haven't gone out of bounds above modeMax and correct if we have
    if (buttonPressed){ 
      Mode = encoderPos; // set the Mode to the current value of input if button has been pressed
      Serial.print("Mode selected: "); //DEBUGGING: print which mode has been selected
      Serial.println(Mode); //DEBUGGING: print which mode has been selected
      buttonPressed = 0; // reset the button status so one press results in one action
      if (Mode == 1) {
        Serial.println("Mode 1"); //DEBUGGING: print which mode has been selected
        encoderPos = setting1; // start adjusting Vout from last set point
      }
      if (Mode == 2) {
        Serial.println("Mode 2"); //DEBUGGING: print which mode has been selected
        encoderPos = setting2; // start adjusting Imax from last set point
      }
      if (Mode == 3) {
        Serial.println("Mode 3"); //DEBUGGING: print which mode has been selected
        encoderPos = setting3; // start adjusting Vmin from last set point
      }
    }
  }
  if (Mode == 1 && buttonPressed) {
    setting1 = encoderPos; // record whatever value your encoder has been turned to, to setting 3
    setAdmin(1,setting1);
    //code to do other things with setting1 here, perhaps update display  
  }
  if (Mode == 2 && buttonPressed) {
    setting2 = encoderPos; // record whatever value your encoder has been turned to, to setting 2
    setAdmin(2,setting2);
    //code to do other things with setting2 here, perhaps update display   
  }
  if (Mode == 3 && buttonPressed){
    setting3 = encoderPos; // record whatever value your encoder has been turned to, to setting 3
    setAdmin(3,setting3);
    //code to do other things with setting3 here, perhaps update display 
  }
} 

// Carry out common activities each time a setting is changed
void setAdmin(byte name, byte setting){
  Serial.print("Setting "); //DEBUGGING
  Serial.print(name); //DEBUGGING
  Serial.print(" = "); //DEBUGGING
  Serial.println(setting);//DEBUGGING
  encoderPos = 0; // reorientate the menu index - optional as we have overflow check code elsewhere
  buttonPressed = 0; // reset the button status so one press results in one action
  Mode = 0; // go back to top level of menu, now that we've set values
  Serial.println("Main Menu"); //DEBUGGING
}

//Rotary encoder interrupt service routine for one encoder pin
void PinA(){
  cli(); //stop interrupts happening before we read pin values
  reading = PIND & 0xC; // read all eight pin values then strip away all but pinA and pinB's values
  if(reading == B00001100 && aFlag) { //check that we have both pins at detent (HIGH) and that we are expecting detent on this pin's rising edge
    encoderPos --; //decrement the encoder's position count
    bFlag = 0; //reset flags for the next turn
    aFlag = 0; //reset flags for the next turn
  }
  else if (reading == B00000100) bFlag = 1; //signal that we're expecting pinB to signal the transition to detent from free rotation
  sei(); //restart interrupts
}

//Rotary encoder interrupt service routine for the other encoder pin
void PinB(){
  cli(); //stop interrupts happening before we read pin values
  reading = PIND & 0xC; //read all eight pin values then strip away all but pinA and pinB's values
  if (reading == B00001100 && bFlag) { //check that we have both pins at detent (HIGH) and that we are expecting detent on this pin's rising edge
    encoderPos ++; //increment the encoder's position count
    bFlag = 0; //reset flags for the next turn
    aFlag = 0; //reset flags for the next turn
  }
  else if (reading == B00001000) aFlag = 1; //signal that we're expecting pinA to signal the transition to detent from free rotation
  sei(); //restart interrupts
}
// end of sketch!
