// Allows to test the communication between the Serial over USB and the connected
// Lora device

// pin 9 is connected to reset
// TX to RX
// RX to TX
// power supply goes through this 

void setup() {               
  Serial.begin(115200);
  Serial1.begin(57600);

  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  digitalWrite(4,HIGH);
  digitalWrite(5,HIGH);
  digitalWrite(6,HIGH);

  pinMode(14, OUTPUT); // just a led to check if it works

  pinMode(9, OUTPUT); // we put the reset to pin 9
  digitalWrite(9,HIGH);
  delay(300);
  digitalWrite(9,LOW);
  delay(300);
  digitalWrite(9,HIGH);
}

byte turnOn=0;
int counter=0;

void loop() {
  counter++;
  if (counter%100==0) {
    turnOn=~turnOn;
    digitalWrite(14, turnOn);
  }
  if (Serial1.available()) {
    Serial.print((char)Serial1.read());  
  }
  if (Serial.available()) {
    Serial1.print((char)Serial.read());  
  }
  delay(1);

}












