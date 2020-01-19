
static uint32_t sysTime = 0;
static uint32_t prevMillis = 0;

uint32_t now() {
  // calculate number of seconds passed since last call to now()
  while (millis() - prevMillis >= 1000) {
    // millis() and prevMillis are both unsigned ints thus the subtraction will always be the absolute value of the difference
    sysTime++;
    prevMillis += 1000; 
  }
  return sysTime;
}

void setTime(uint32_t t) { 
  sysTime = t;  
  prevMillis = millis();  // restart counting from now (thanks to Korman for this fix)
} 


