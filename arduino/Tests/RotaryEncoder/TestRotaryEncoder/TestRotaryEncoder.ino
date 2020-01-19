
#define RX 0
#define TX 1
#define BUTTON 7
#define INT_RX 2
#define INT_TX 3
#define INT_BUTTON 4

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin 13 as an output.
  pinMode(RX, INPUT);
  pinMode(TX, INPUT);
  Serial.begin(115200);
}

// the loop function runs over and over again forever
void loop() {
  attachInterrupt(INT_RX, rx, CHANGE);
  attachInterrupt(INT_TX, tx, CHANGE);
  attachInterrupt(INT_BUTTON, button, CHANGE);
  delay(2500);
  Serial.println("-");
}

void rx() {
  Serial.print(micros());
  Serial.print(" RX ");
  Serial.println(digitalRead(RX));
}

void tx() {
    Serial.print(micros());
  Serial.print(" TX ");
  Serial.println(digitalRead(TX));
}

void button() {
    Serial.print(micros());
  Serial.print(" BUTTON ");
  Serial.println(digitalRead(BUTTON));
}


