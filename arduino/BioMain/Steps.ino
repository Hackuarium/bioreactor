#if defined(THR_STEPS)

NIL_WORKING_AREA(waThreadSteps, 100);

boolean DEBUG_STEPS = false;

NIL_THREAD(ThreadSteps, arg) {
  nilThdSleepMilliseconds(3129); // wait a little bit not everything starts at once


  // TODO know when the minute starts so that the minute does not change after couple of seconds
  byte previousMinute = getMinute();

  while (true) {
    // allows to change the step from the terminal, we reload each time the step
    byte index = getParameter(PARAM_CURRENT_STEP);
    if (index >= NB_STEP_PARAMETERS) {
      index = 0;
    }
    int stepValue = getParameter(index + FIRST_STEP_PARAMETER);
    byte parameter = (stepValue & 0b0111100000000000) >> 11;
    byte currentMinute = getMinute();
    int value = stepValue & 0b0000011111111111;
    if (DEBUG_STEPS) {
      Serial.print("======> ");
      Serial.println(index);
      Serial.print("S:");
      printBits(stepValue);
      Serial.print("P:");
      Serial.println(parameter);
      Serial.print("M:");
      Serial.println(currentMinute);
      Serial.print("V:");
      Serial.println(value);
    }
    if (stepValue >> 15) { // we set a parameter
      switch (parameter) {
        case 0:
          setParameter(PARAM_TEMP_TARGET, value * 100);
          break;
      }
      index++;
    } else { // it is an action
      int waitingTime = getParameter(PARAM_CURRENT_WAIT_TIME);
      switch (parameter) {
        case 0: // Do nothing
          index++;
          break;
        case 1: // Wait in minutes
        case 2: // Wait in hours
          if (waitingTime <= 0 && stepValue > 0) {
            setParameter(PARAM_CURRENT_WAIT_TIME, value * (parameter == 1 ? 1 : 60));
          } else {
            if (DEBUG_STEPS) {
              Serial.print(waitingTime);
              Serial.print(" ");
              Serial.print(currentMinute);
              Serial.print(" ");
              Serial.println(previousMinute);
            }
            if (currentMinute != previousMinute) {
              waitingTime--;
              previousMinute = currentMinute;
              setParameter(PARAM_CURRENT_WAIT_TIME, waitingTime);
            }
            if (waitingTime == 0) {
              index++;
            }
          }
          break;
        case 3: // Wait for weight reduction to yy grams
          if (getParameter(PARAM_WEIGHT_G) <= value) {
            index++;
          }
          break;
        case 4: // Wait for weight increase to yy grams
          if (getParameter(PARAM_WEIGHT_G) >= value) {
            index++;
          }
          break;
        case 5: // Wait for temperature change (continue if < 0.5°C)
          if (abs(getParameter(PARAM_TEMP_EXT1) - getParameter(PARAM_TEMP_TARGET)) < value) {
            index++;
          }
          break;
        case 8:
          setParameter(PARAM_STATUS, stepValue);
          index++;
          break;
        default:
          index++;
      }
    }
    setParameter(PARAM_CURRENT_STEP, index);
    nilThdSleepMilliseconds(1000);
  }
}

byte getMinute() {
  return (byte)((millis() % 3600000) / 60000);
}

void printBits(int x) {
  for (byte i = 16; i > 0; i--) {
    Serial.print(x >> (i - 1) & 1);
  }
  Serial.println("");
}

#endif
