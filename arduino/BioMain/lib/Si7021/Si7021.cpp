/*
 SparkFun Si7021 Temperature and HUmidity Breakout
 By: Joel Bartlett
 SparkFun Electronics
 Date: December 10, 2015

 This is an Arduino library for the Si7021 Temperature and Humidity Sensor
 Breakout

 This library is based on the following libraries:

 HTU21D Temperature / Humidity Sensor Library
 By: Nathan Seidle
 https://github.com/sparkfun/HTU21D_Breakout/tree/master/Libraries

 Arduino Si7010 relative humidity + temperature sensor
 By: Jakub Kaminski, 2014
 https://github.com/teoqba/ADDRESS

 This Library is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This Library is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 For a copy of the GNU General Public License, see
 <http://www.gnu.org/licenses/>.
 */

#include "Si7021.h"

// Initialize
Weather::Weather() {}

bool Weather::begin(void) {

  uint8_t ID_Temp_Hum = checkID();

  int x = 0;

  if (ID_Temp_Hum == 0x15) // Ping CheckID register
    x = 1;
  else if (ID_Temp_Hum == 0x32)
    x = 2;
  else
    x = 0;
}

/****************Si7021 & HTU21D
 * Functions**************************************/

int Weather::getRH() {
  // Measure the relative humidity
  int32_t RH_Code = makeMeasurment(HUMD_MEASURE_NOHOLD);
  if (RH_Code == 32768)
    return ERROR_VALUE;
  return min(10000, (12500 * RH_Code / 65536) - 600);
}

int Weather::readTemp() {
  // Read temperature from previous RH measurement.
  int32_t temp_Code = makeMeasurment(TEMP_PREV);
  if (temp_Code == 32768)
    return ERROR_VALUE;
  return (17572 * temp_Code / 65536) - 4685;
}

int Weather::getTemp() {
  // Measure temperature
  int32_t temp_Code = makeMeasurment(TEMP_MEASURE_NOHOLD);
  if (temp_Code == 32768)
    return ERROR_VALUE;
  return (17572 * temp_Code / 65536) - 4685;
}

void Weather::heaterOn() {
  // Turns on the ADDRESS heater
  uint8_t regVal = readReg();
  regVal |= _BV(HTRE);
  // turn on the heater
  writeReg(regVal);
}

void Weather::heaterOff() {
  // Turns off the ADDRESS heater
  uint8_t regVal = readReg();
  regVal &= ~_BV(HTRE);
  writeReg(regVal);
}

void Weather::changeResolution(uint8_t i) {
  // Changes to resolution of ADDRESS measurements.
  // Set i to:
  //      RH         Temp
  // 0: 12 bit       14 bit (default)
  // 1:  8 bit       12 bit
  // 2: 10 bit       13 bit
  // 3: 11 bit       11 bit

  uint8_t regVal = readReg();
  // zero resolution bits
  regVal &= 0b011111110;
  switch (i) {
  case 1:
    regVal |= 0b00000001;
    break;
  case 2:
    regVal |= 0b10000000;
    break;
  case 3:
    regVal |= 0b10000001;
  default:
    regVal |= 0b00000000;
    break;
  }
  // write new resolution settings to the register
  writeReg(regVal);
}

void Weather::reset() {
  // Reset user resister
  writeReg(SOFT_RESET);
}

uint8_t Weather::checkID() {
  uint8_t ID_1;

  nilSemWait(&lockTimeCriticalZone);
  // Check device ID
  WireM.beginTransmission(ADDRESS);
  WireM.write(0xFC);
  WireM.write(0xC9);
  WireM.endTransmission();

  WireM.requestFrom(ADDRESS, 1);

  ID_1 = WireM.read();
  nilSemSignal(&lockTimeCriticalZone);
  return (ID_1);
}

uint16_t Weather::makeMeasurment(uint8_t command) {
  // Take one ADDRESS measurement given by command.
  // It can be either temperature or relative humidity
  // TODO: implement checksum checking

  uint16_t nBytes = 3;
  // if we are only reading old temperature, read olny msb and lsb
  if (command == TEMP_PREV)
    nBytes = 2;

  nilSemWait(&lockTimeCriticalZone);
  WireM.beginTransmission(ADDRESS);
  WireM.write(command);
  WireM.endTransmission();
  nilSemSignal(&lockTimeCriticalZone);
  // When not using clock stretching (*_NOHOLD commands) delay here
  // is needed to wait for the measurement.
  // According to datasheet the max. conversion time is ~22ms
  nilThdSleepMilliseconds(23);

  nilSemWait(&lockTimeCriticalZone);
  WireM.requestFrom(ADDRESS, nBytes);
  unsigned int measurement;
  if (WireM.available() != nBytes) {
    measurement = ERROR_VALUE;
  } else {
    // Clear the last to bits of LSB to 00.
    // According to datasheet LSB of RH is always xxxxxx10
    measurement = WireM.read() << 8 | (WireM.read() & 0xFC);
  }
  nilSemSignal(&lockTimeCriticalZone);

  return measurement;
}

void Weather::writeReg(uint8_t value) {
  // Write to user register on ADDRESS
  WireM.beginTransmission(ADDRESS);
  WireM.write(WRITE_USER_REG);
  WireM.write(value);
  WireM.endTransmission();
}

uint8_t Weather::readReg() {
  // Read from user register on ADDRESS
  WireM.beginTransmission(ADDRESS);
  WireM.write(READ_USER_REG);
  WireM.endTransmission();
  WireM.requestFrom(ADDRESS, 1);
  uint8_t regVal = WireM.read();
  return regVal;
}
