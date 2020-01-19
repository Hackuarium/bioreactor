// The maximal length of a parameter value. It is a int so the value must be between -32768 to 32767

// LORA required 32 characters + the command



char serialBuffer[SERIAL_BUFFER_LENGTH];
byte serialBufferPosition=0;

NIL_WORKING_AREA(waThreadSerial, 128); // minimum 128
NIL_THREAD(ThreadSerial, arg) {

  Serial.begin(115200);
  while(true) {
    while (Serial.available()) {
      // get the new byte:
      char inChar = (char)Serial.read(); 

      if (inChar==13 || inChar==10) {
        // this is a carriage return;
        if (serialBufferPosition>0) {
          printResult(serialBuffer, &Serial);
        } 
        serialBufferPosition=0;
        serialBuffer[0]='\0';
      } 
      else {
        if (serialBufferPosition<SERIAL_BUFFER_LENGTH) {
          serialBuffer[serialBufferPosition]=inChar;
          serialBufferPosition++;
          if (serialBufferPosition<SERIAL_BUFFER_LENGTH) {
            serialBuffer[serialBufferPosition]='\0';
          }
        }
      }  
    }
    nilThdSleepMilliseconds(1);
  }
}




void printResult(char* data, Print* output) {
  boolean theEnd=false;
  byte paramCurrent=0; // Which parameter are we defining
  char paramValue[SERIAL_MAX_PARAM_VALUE_LENGTH];
  paramValue[0]='\0';
  byte paramValuePosition=0;
  byte i=0;
  boolean inValue=false;

  while (!theEnd) {
    byte inChar=data[i];
    i++;
    if (i==SERIAL_BUFFER_LENGTH) theEnd=true;
    if (inChar=='\0') {
      theEnd=true;
    }
    else if ((inChar>47 && inChar<58) || inChar=='-' || inValue) { // a number (could be negative)
      if (paramValuePosition<SERIAL_MAX_PARAM_VALUE_LENGTH) {
        paramValue[paramValuePosition]=inChar;
        paramValuePosition++;
        if (paramValuePosition<SERIAL_MAX_PARAM_VALUE_LENGTH) {
          paramValue[paramValuePosition]='\0';
        }
      }
    } 
    else if (inChar>64 && inChar<92) { // an UPPERCASE character so we define the field
      // we extend however the code to allow 2 letters fields !!!
      if (paramCurrent>0) {
        paramCurrent*=26;
      }
      paramCurrent+=inChar-64;
      if (paramCurrent>MAX_PARAM) {
        paramCurrent=0; 
      }
    }
    if (inChar==',' || theEnd) { // store value and increment
      if (paramCurrent>0) {
        if (paramValuePosition>0) {
          setAndSaveParameter(paramCurrent-1,atoi(paramValue));
          output->println(parameters[paramCurrent-1]);
        } 
        else {
          output->println(parameters[paramCurrent-1]);
        }
        if (paramCurrent<=MAX_PARAM) {
          paramCurrent++;
          paramValuePosition=0;
          paramValue[0]='\0';
        } 
        else {
          debugger(1,inChar);
        }
      }
    }
    if (data[0]>96 && data[0]<123 && (i>1 || data[1]<97 || data[1]>122)) { // we may have one or 2 lowercasee
      inValue=true;
    }
  }

  // we will process the commands, it means it starts with lowercase

    switch (data[0]) {
  case 'a':
    processLoraCommand(data[1], paramValue, output);
    break;
  case 'c':
    if (paramValuePosition>0) {
      printCompactParameters(output, atoi(paramValue));
    } 
    else {
      printCompactParameters(output);
    } 
    break; 
  case 'd':
    getDebuggerLog(output);
    break;
  case 'e':
    if (paramValuePosition>0) {
      setTime(atol(paramValue));
    } 
    else {
      output->println(now());
    }
    break;
  case 'f':
    printFreeMemory(output);
    break;
  case 'g':
    printFreeMemory(output);
    break;
  case 'h':
    serialPrintHelp(output);
    break;
  case 'i':
    initParameters();
    output->println(F("done"));
    break;
  case 'l':
    getLoggerLog(output);
    break;
#ifdef ONE_WIRE
  case 'o':
    oneWireInfo(output);
    break;
#endif
  case 's':
    printParameters(output);
    break;
  case 'z':
    getStatusEEPROM(output);
    break;
  }
  output->println("");
}


void serialPrintHelp(Print* output) {
  output->println(F("Lor(a) help"));
  output->println(F("(c)ompact settings"));
  output->println(F("(e)poch"));
  output->println(F("(f)ree mem"));
  output->println(F("(h)elp"));
  output->println(F("(i)nitialize parameters"));
#ifdef ONE_WIRE
  output->println(F("(o)ne-wire"));
#endif
  //  output->println(F("(l)og"));
  //  output->println(F("(q)ualifier"));
  output->println(F("(s)ettings"));
  output->println(F("(z) eeprom"));
}

