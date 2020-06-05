#ifdef THR_ONEWIRE

/*******************************************
    THREAD TEMPERATURE
    This module reads the temperature of the different temperature sensors.
    The sensor is a dallas 1-wire ds18b20.

    There is only one device per plug. Instead of searching for the
    adresses of the devices, we use the skip rom command which allow
    us to directly ask any device on the line without address.

    The sequence is as follow:
    We ask the sensor to update its value :
    1. Issue a Reset pulse and observe the Presence of the thermometer
    2. Issue the Skip Rom command (0xCC)
    3. Issue the Convert T command (0×44)

    The conversion in 12 bits take 750ms, so we actually read the previous value :
    1. Issue a Reset pulse and observe the Presence of the thermometer
    2. Issue the Skip Rom command (0xCC)
    3. Issue the Read Scratchpad command (0xBE)
    4. Read the next two bytes which represent the temperature
 *********************************************/

#include "../lib/onewire/OneWire.cpp"

byte oneWireAddress[8];

#ifdef TEMP_LIQ
OneWire oneWire1(TEMP_LIQ);
#endif

#ifdef TEMP_PCB
OneWire oneWire2(TEMP_PCB);
#endif

void getTemperature(OneWire &ow, int parameter, byte errorFlag);
void oneWireInfoSS(OneWire &ow, Print* output) ;

NIL_WORKING_AREA(waThreadTemp, 180);  // should be 50 without Serial.println

NIL_THREAD(ThreadTemp, arg) {
  nilThdSleepMilliseconds(200);

  while (true) {
#ifdef TEMP_LIQ
    getTemperature(oneWire1, PARAM_TEMP_LIQ, FLAG_TEMP_LIQ_PROBE_ERROR);
#endif

#ifdef TEMP_PCB
    getTemperature(oneWire2, PARAM_TEMP_PCB, FLAG_TEMP_PCB_PROBE_ERROR);
#endif
    nilThdSleepMilliseconds(200);
  }
}


void getTemperature(OneWire &ow, int parameter, byte errorFlag) {
  byte present = 0;
  byte type_s;
  byte data[12];
  byte addr[8];
  float celsius;

  if ( !ow.search(addr)) {
    ow.reset_search();
    nilThdSleepMilliseconds(200);
    if (!ow.search(addr)) {
      saveAndLogError(true, errorFlag);
      setParameter(parameter, ERROR_VALUE);
      return;
    } else {
      saveAndLogError(false, errorFlag);
    }
  } else {
    saveAndLogError(false, errorFlag);
  }


  if (OneWire::crc8(addr, 7) != addr[7]) {
    Serial.println(F("CRC invalid!"));
    return;
  }

  // the first ROM byte indicates which chip
  switch (addr[0]) {
    case 0x10:
      type_s = 1;
      break;
    case 0x28:
      type_s = 0;
      break;
    case 0x22:
      type_s = 0;
      break;
    default:
      return;
  }

  nilSemWait(&lockTimeCriticalZone);
  ow.reset();
  ow.select(addr);
  ow.write(0x44, 1);        // start conversion, with parasite power on at the end
  nilSemSignal(&lockTimeCriticalZone);

  nilThdSleepMilliseconds(800);     // maybe 750ms is enough, maybe not
  // we might do a ds.depower() here, but the reset will take care of it.

  nilSemWait(&lockTimeCriticalZone);
  present = ow.reset();
  ow.select(addr);
  ow.write(0xBE);         // Read Scratchpad
  nilSemSignal(&lockTimeCriticalZone);

  for (byte i = 0; i < 9; i++) {           // we need 9 bytes
    data[i] = ow.read();
  }

  // Convert the data to actual temperature
  // because the result is a 16 bit signed integer, it should
  // be stored to an "int16_t" type, which is always 16 bits
  // even when compiled on a 32 bit processor.
  int16_t raw = (data[1] << 8) | data[0];
  if (type_s) {
    raw = raw << 3; // 9 bit resolution default
    if (data[7] == 0x10) {
      // "count remain" gives full 12 bit resolution
      raw = (raw & 0xFFF0) + 12 - data[6];
    }
  } else {
    byte cfg = (data[4] & 0x60);
    // at lower res, the low bits are undefined, so let's zero them
    if (cfg == 0x00) raw = raw & ~7;  // 9 bit resolution, 93.75 ms
    else if (cfg == 0x20) raw = raw & ~3; // 10 bit res, 187.5 ms
    else if (cfg == 0x40) raw = raw & ~1; // 11 bit res, 375 ms
    //// default is 12 bit resolution, 750 ms conversion time
  }
  celsius = (float)raw / 16.0;
  setParameter(parameter, (int)(celsius * 100));
  ow.reset_search();
  nilThdSleepMilliseconds(1000);
}

//bus info function
void oneWireInfo(Print* output) { // TODO
#ifdef TEMP_LIQ
  output->println(F("Liquid"));
  oneWireInfoSS(oneWire1, output);
#endif
#ifdef TEMP_PCB
  output->println(F("PCB"));
  oneWireInfoSS(oneWire2, output);
#endif
}

void oneWireInfoSS(OneWire &ow, Print* output) { // TODO
  nilSemWait(&lockTimeCriticalZone);
  ow.reset_search();
  while (ow.search(oneWireAddress)) {
    for (byte i = 0; i < 8; i++) {
      output->print(' ');
      if (oneWireAddress[i]<16) output->print('0');
      output->print(oneWireAddress[i], HEX);
    }
    output->println("");
    nilThdSleepMilliseconds(250);
  }
  nilSemSignal(&lockTimeCriticalZone);
}

#endif
