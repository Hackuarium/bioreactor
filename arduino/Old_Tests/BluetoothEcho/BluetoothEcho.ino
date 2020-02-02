// Allows to test the communication between the Serial over USB and the connected
// BlueTooth device


// TX to RX
// RX to TX

void setup() {               
  Serial.begin(9600);
  Serial1.begin(9600);

}

long counter=0;

void loop() {
  counter++;
  if (counter%10000==0) {
    Serial.println("OK");
  }
  if (Serial1.available()) {
    Serial.print((char)Serial1.read());  
  }
  if (Serial.available()) {
    Serial1.print((char)Serial.read());  
  }
  delay(1);

}












