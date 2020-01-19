
byte pins[]={10,9,8,6,12,A6,13};

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin 13 as an output.
  for (byte i=0; i<sizeof(pins); i++) {
    pinMode(pins[i], OUTPUT);
  }
  pinMode(13,OUTPUT);
}

unsigned int counter=0;

void loop() {
  counter++;
  for (byte i=0; i<sizeof(pins); i++) {
    if (counter%(2<<i)==0) {
      digitalWrite(pins[i], ! digitalRead(pins[i]));
    }
  }
  delay(2);
}
