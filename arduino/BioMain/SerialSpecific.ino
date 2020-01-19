void processSpecificCommand(char* data, char* paramValue, Print* output) {
  switch (data[0]) {
#ifdef THR_LORA
    case 'a':
      processLoraCommand(data[1], paramValue, output);
      break;
#endif
    case 'i':
#if defined(GAS_CTRL) || defined(PH_CTRL)
      wireInfo(output);
#else  //not elsif !!
      noThread(output);
#endif
      break;
#ifdef THR_LINEAR_LOGS
    case 'l':
      processLoggerCommand(data[1], paramValue, output);
      break;
#else  //not elsif !!
      noThread(output);
#endif
    case 'o':
#if defined(TEMP_LIQ) || defined(TEMP_PCB)
      oneWireInfo(output);
#else
      noThread(output);
#endif
      break;
    case 'p':
      printGeneralParameters(output);
      break;

    case 't':
      output->print(F("Status: "));
      output->println(getParameter(PARAM_STATUS));
      for (byte i = 0; i < 10; i++) {
        output->print(i);
        output->print(": ");
        output->println(getParameterBit(PARAM_STATUS, i));
      }
      output->print(F("Enabled: "));
      output->println(getParameter(PARAM_ENABLED));
      for (byte i = 0; i < 3; i++) {
        output->print(i);
        output->print(": ");
        output->println(getParameterBit(PARAM_ENABLED, i));
      }
      output->print(F("Error: "));
      output->println(getParameter(PARAM_ERROR));
      for (byte i = 0; i < 6; i++) {
        output->print(i);
        output->print(": ");
        output->println(getParameterBit(PARAM_ERROR, i));
      }
      break;
#ifdef FOOD_CTRL
    case 'w':
      processWeightCommand(data[1], paramValue, output);
      break;
#endif
  }
}

void printSpecificHelp(Print* output) {
  output->println(F("(i)2c"));
#ifdef THR_LINEAR_LOGS
  output->println(F("(l)og"));
#endif
  output->println(F("(o)ne-wire"));
  output->println(F("(p)aram"));


  output->println(F("s(t)atus"));
#ifdef FOOD_CTRL
  output->println(F("(w)eight"));
#endif
}



void printGeneralParameters(Print* output) {
  output->print(F("EPOCH:"));
  output->println(now());
  output->print(F("millis:"));
  output->println(millis());
#ifdef I2C_RELAY_FOOD
  output->print(F("I2C relay food:"));
  output->println(I2C_RELAY_FOOD);
#endif
#ifdef FLUX
  output->print(F("I2C Flux:"));
  output->println(I2C_FLUX);
#endif
#ifdef THR_LINEAR_LOGS
  output->print(F("Next log index:"));
  output->println(nextEntryID);
#endif
#ifdef THR_LINEAR_LOGS
  output->print(F("FlashID:"));
  sst.printFlashID(output);
#endif
}



