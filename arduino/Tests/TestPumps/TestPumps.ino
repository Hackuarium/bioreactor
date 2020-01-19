
// Before v4.4 it was 20 and 21

#define PUMP1 10
#define PUMP2 5


void setup() {
  pinMode(PUMP1, OUTPUT);
   pinMode(PUMP2, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  digitalWrite(PUMP2, LOW); 
  digitalWrite(PUMP1, HIGH); 
  delay(5000);                
  digitalWrite(PUMP1, LOW);   
  digitalWrite(PUMP2, HIGH); 
  delay(5000);     
}
