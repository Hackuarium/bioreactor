int TEMP_PID = 6;

void setup() {
  pinMode(TEMP_PID, OUTPUT);
}

void loop() {
  while(true){
  //digitalWrite(TEMP_PID, HIGH);
  analogWrite(TEMP_PID, 60);   // without 1kohm resistance after diode & IRGS14C40LPBF - D2 pack
  delay(5000);
  }           
}
