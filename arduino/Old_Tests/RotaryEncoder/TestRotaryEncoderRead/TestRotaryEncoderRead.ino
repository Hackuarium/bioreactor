
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


  attachInterrupt(INT_RX, rx, CHANGE);
  attachInterrupt(INT_TX, tx, CHANGE);
  attachInterrupt(INT_BUTTON, button, CHANGE);

}


byte status=0;
int counter=0;
int previous=0;

// the loop function runs over and over again forever
void loop() {

  if (counter!=previous) {
    Serial.println(counter);
    previous=counter; 
  }
  delay(5);
}

void rx() {
  if (digitalRead(RX)==1) {
    if (status==2) {
      counter++; 
      status=0;
    } else {
      status=1;
    }
  } 
  else {
    status=0;
  }
}
void tx() {
  if (digitalRead(TX)==1) {
    if (status==1) {
      counter--; 
      status=0;
    } else {
     status=2; 
    }
  } 
  else {
    status=0;
  }
}



void button() {
  Serial.print(micros());
  Serial.print(" BUTTON ");
  Serial.println(digitalRead(BUTTON));
}












