#ifdef THR_WEIGHT

#include "libino/HX711/HX711.cpp"

HX711 scale(WEIGHT_DATA, WEIGHT_CLK);

NIL_WORKING_AREA(waThreadWeight, 56); // minimum of 32 !

NIL_THREAD(ThreadWeight, arg) {
  nilThdSleepMilliseconds(1234); // wait a little bit not everything starts at once

  /********************************************
               initialisation
  ********************************************/
  int weight;

  /********************************************
               Thread Loop
  ********************************************/
  while (true) {
    nilThdSleepMilliseconds(1000);

    weight = getWeight(); //sensor read, better to have a higher value if the weight increase
    setParameter(PARAM_WEIGHT, weight);
    setParameter(PARAM_WEIGHT_G, convertWeightToG(weight));

    // are we outside ranges ?

    int error = (getParameter(PARAM_WEIGHT_MAX) - getParameter(PARAM_WEIGHT_MIN)) / 5;

    if ((error > 0 && ((weight < (getParameter(PARAM_WEIGHT_MIN) - error)) || (weight > (getParameter(PARAM_WEIGHT_MAX) + error)))) ||
        (error < 0 && ((weight > (getParameter(PARAM_WEIGHT_MIN) - error)) || (weight < (getParameter(PARAM_WEIGHT_MAX) + error))))) {
      saveAndLogError(true, FLAG_WEIGHT_RANGE_ERROR);
    } else {
      saveAndLogError(false, FLAG_WEIGHT_RANGE_ERROR);
    }

  }
}

void printWeightHelp(Print* output) {
  output->println(F("Weight help"));
  output->println(F("(we) Empty (tare)"));
  output->println(F("(wk) Empty + 1kg"));
  output->println(F("(wl) Low level"));
  output->println(F("(wh) High level"));
  output->println(F("(wt) Test"));
}

int getWeight() { // we can not avoid to have some errors measuring the weight
  // and currently we don't know where it is coming from
  // so we need to find out what are the correct values and what are the wrong one
  // if there is an error it always end with 00000001
  // we will also need 4 consecutive values that differ less than 10%
  byte counter = 0;
  long weight = 0;
  while (counter < 4) {
    while (!scale.is_ready()) {
      nilThdSleepMilliseconds(10);
    }
    nilSemWait(&lockTimeCriticalZone);
    long currentWeight = scale.read();
    nilSemSignal(&lockTimeCriticalZone);

    if ((currentWeight & 0b11111111) != 1) {
      if (weight == 0) {
        weight += currentWeight;
        counter++;
      } else {
        int difference = abs(100 - (weight * 100 / counter) / currentWeight);
        if (difference < 10) {
          weight += currentWeight;
          counter++;
        } else {
          weight = 0;
          counter = 0;
        }
      }
      nilThdSleepMilliseconds(10);
    }
  }
  return weight / counter / 100;
}

int convertWeightToG(int weight) {
  return ((long)(weight - getParameter(PARAM_WEIGHT_OFFSET)) * 1000) / getParameter(PARAM_WEIGHT_FACTOR);
}


void processWeightCommand(char command, char* data, Print * output) {
  int weight = getWeight();
  switch (command) {
    case 'e': // define the empty level
      setAndSaveParameter(PARAM_WEIGHT_OFFSET, weight);
      output->println(weight);
      break;
    case 'k': // define the weight one kg over the tare
      setAndSaveParameter(PARAM_WEIGHT_FACTOR, weight - getParameter(PARAM_WEIGHT_OFFSET));
      output->println(weight);
      break;
    case 'l': // define low level
      setAndSaveParameter(PARAM_WEIGHT_MIN, weight);
      output->println(weight);
      break;
    case 'h': // define high level
      setAndSaveParameter(PARAM_WEIGHT_MAX, weight);
      output->println(weight);
      break;
    case 't':
      output->println(F("Current weight"));
      for (byte i = 0; i < 10; i++) {
        int weight = getWeight();
        output->print(weight);
        output->print(F(" = "));
        output->print(convertWeightToG(weight));
        output->println("g");
      }
      break;
    default:
      printWeightHelp(output);
  }
}
#endif
