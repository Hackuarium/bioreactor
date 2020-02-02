#define STEPPER {0b00010000,0b00100000,0b01000000,0b10000000}

byte STEPPER_TAB[] = STEPPER;

void stopStepper() {
  PORTB &= ~(STEPPER_TAB[0] | STEPPER_TAB[1]);
  PORTF &= ~(STEPPER_TAB[2] | STEPPER_TAB[3]);
}

int counter = 0;

void setup() {
  stopStepper();
  DDRB |= (STEPPER_TAB[0] | STEPPER_TAB[1]) ;
  DDRF |= (STEPPER_TAB[2] | STEPPER_TAB[3]) ;
}

// the loop routine runs over and over again forever:
void loop() {

  while (true) {
    counter++;
    switch (counter % 4) {
      case 0:
        PORTB |= STEPPER_TAB[0];
        break;
      case 1:
        PORTB |= STEPPER_TAB[1];   // 1 or 2
        break;
      case 3:   // 2 or 3
        PORTF |= STEPPER_TAB[2];
        break;
      case 2:
        PORTF |= STEPPER_TAB[3];
        break;
    }

    delay(5);
    stopStepper();
  }

}

