#ifdef LCD_SELECT
/************************************
       LCD Control Functions
************************************/
void setupLCD() {
  pinMode(LCD_SELECT, OUTPUT);
  digitalWrite(LCD_SELECT, HIGH);
  SPI.setClockDivider(SPI_CLOCK_DIV8);
#ifndef FLASH_SELECT
  SPI.begin();
  SPI.setDataMode(SPI_MODE0);
  SPI.setBitOrder(MSBFIRST);
#endif
}
/***********************************************
               SPI  buffer write
************************************************/
//SPI buffer
byte buff[2 * MAX_PARAM + 2]; //2 of overhead for correct comm

//SPI buffer prep --> returns total buffer size
byte toBuff(byte nbParams) {
  buff[0] = 2 * nbParams ;
  byte checkDigit = buff[0];
  for (byte i = 0; i < nbParams; i++) {
    buff[2 * i + 1] = (byte)((getParameter(i) >> 8) & (0x00FF));
    checkDigit ^= buff[2 * i + 1];
    buff[2 * (i + 1)] = (byte)((getParameter(i)) & (0x00FF));
    checkDigit ^= buff[2 * (i + 1)];
  }
  buff[2 * nbParams + 1] = checkDigit;
  return 2 * nbParams + 1; //total size
}

//sensors flash params
byte lastParamsToBuff() {
  return toBuff(NB_PARAMETERS_LINEAR_LOGS);
}
//all params
byte allParamsToBuff() {
  return toBuff(MAX_PARAM);
}
/****************************************************************
         SPI  buffer send and receive
*****************************************************************/
byte buffReturn[5]; //2 of overhead for correct comm + 1 param index byte + 1 param value int

void sendBuffer(byte buffSize) {
  byte in_byte = 0;              // incoming byte from LCD
  byte parameter = 0;            // parsed parameter number
  int value = 0;                 // parsed parameter value
  byte pos = 0;                  // number of bytes read after initiating byte
  digitalWrite(LCD_SELECT, LOW);//enable LCD_SS
  for (int i = 0; i < buffSize; i++) {
    // transfer and get bytes
    if (i < sizeof(buffReturn))buffReturn[i] = SPI.transfer(char(buff[i]));
    else SPI.transfer(char(buff[i]));
    delayMicroseconds(20);
  }
  digitalWrite(LCD_SELECT, HIGH); // disable LCD_SS
}

//only parse one returned param for now
void parseReturnBuff() {
  int  paramValue = 0;
  byte checkDigit = 0;
  if (buffReturn[0] != 0) {
    byte checkDigit = buffReturn[0]; //contains the size of the message
    checkDigit ^= buffReturn[1];
    checkDigit ^= buffReturn[2];
    checkDigit ^= buffReturn[3];
    //abort if error on checkdigit
    if (checkDigit != buffReturn[4]) {
#ifdef DEBUG_LCD
      Serial.println(F("SPI Com Error"));
#endif
      return;
    }
    byte paramIndex = buffReturn[1];
    paramValue = (int)(buffReturn[2] << 8) + buffReturn[3];
    if (paramIndex >= NB_PARAMETERS_LINEAR_LOGS && paramIndex < MAX_PARAM) {
#ifdef DEBUG_LCD
      Serial.println(F("Setting Param"));
#endif
      setAndSaveParameter(paramIndex, paramValue);
    } else {
#ifdef DEBUG_LCD
      Serial.println(F("Param Index out of limits"));
#endif
      return;
    }
  } else {
#ifdef DEBUG_LCD
    Serial.println(F("buffReturn empty"));
#endif
    return;
  }
}

/***********************************************
        SPI Slave thread for SPI
************************************************/
NIL_WORKING_AREA(waThreadLCD, 24);
NIL_THREAD(ThreadLCD, arg) {
  nilThdSleepMilliseconds(1000);
  byte buffSize = 0;
  while (true) {
    buffSize = allParamsToBuff(); //Load Last Parameters Into SPI buffer
    protectThread();
    sendBuffer(buffSize);
    unprotectThread();
    parseReturnBuff();
    nilThdSleepMilliseconds(500);
  }
}
#endif

