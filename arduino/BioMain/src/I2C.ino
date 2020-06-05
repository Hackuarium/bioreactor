#if defined(I2C)

#include <Wire.h>
/*
 FLUX
 - B1011 XXX R/W  (XXX is the user defined address and R/W the read/write byte) --> TBD
 PH METER
 - B????????
 */

#define WIRE_MAX_DEVICES 5
byte numberI2CDevices=0;
byte wireDeviceID[WIRE_MAX_DEVICES];

NIL_WORKING_AREA(waThreadWire, 88); //min of 64 when pH present
NIL_THREAD(ThreadWire, arg) {

  nilThdSleepMilliseconds(1000);

  byte aByte=0;
  byte* wireFlag32=&aByte;
  unsigned int wireEventStatus=0;
  Wire.begin();
         
  nilThdSleepMilliseconds(10000); //wait for probe warm-up

  while(true) {

    if (wireEventStatus%25==0) {
      wireUpdateList();
    }
    wireEventStatus++;

    /*********
     *  pH
     *********/    

    #ifdef GAS_CTRL
      getAnemometer(gas_wire_write);
    #endif

  
    #ifdef MODE_CALIBRATE //update faster in calibration mode
    nilThdSleepMilliseconds(100); 
    #else
    nilThdSleepMilliseconds(500); 
    #endif
  }
}


/********************
 * Utilities functions 
 **********************/

void wireWrite(uint8_t address, uint8_t _data ) {
  Wire.beginTransmission(address);
  Wire.write(_data);
  Wire.endTransmission();
}

void wireWrite(uint8_t address, uint8_t reg, uint8_t _data ) // used by 4-relay
{
  Wire.beginTransmission(address);
  Wire.write(reg);
  Wire.write(_data);
  Wire.endTransmission();
}

byte wireRead(uint8_t address) {
  byte _data = 0;
  Wire.requestFrom(address, (uint8_t)1);
  if(Wire.available()) {
    _data = Wire.read();
  }
  return _data;
}

void wireInfo(Print* output) {
  //wireUpdateList();
  output->println("I2C");

  for (byte i=0; i<numberI2CDevices; i++) {
    output->print(i);
    output->print(": ");
    output->print(wireDeviceID[i]);
    output->print(" - ");
    output->println(wireDeviceID[i],BIN);
  }
}


void wireUpdateList() {
  // 16ms
  byte _data;
  byte currentPosition=0;
  // I2C Module Scan, from_id ... to_id
  for (byte i=0; i<=127; i++)
  {
    Wire.beginTransmission(i);
    Wire.write(&_data, 0);
    // I2C Module found out!
    if (Wire.endTransmission()==0)
    {
      // there is a device, we need to check if we should add or remove a previous device
      if (currentPosition<numberI2CDevices && wireDeviceID[currentPosition]==i) { // it is still the same device that is at the same position, nothing to do
        currentPosition++;
      } 
      else if (currentPosition<numberI2CDevices && wireDeviceID[currentPosition]<i) { // some device(s) disappear, we need to delete them
        wireRemoveDevice(currentPosition);
        i--;
      } 
      else if (currentPosition>=numberI2CDevices || wireDeviceID[currentPosition]>i) { // we need to add a device
        //Serial.print("add: ");        DEBUG POUR CONNAITRE L'ADRESSE DE L'I2C !!!!!!!!
        //Serial.println(i);
        wireInsertDevice(currentPosition, i);
        currentPosition++;
      }
      nilThdSleepMilliseconds(1);
    }
  }
  while (currentPosition<numberI2CDevices) {
    wireRemoveDevice(currentPosition);
  }
}

void wireRemoveDevice(byte id) {
  for (byte i=id; i<numberI2CDevices-1; i++) {
    wireDeviceID[i]=wireDeviceID[i+1];
  }
  numberI2CDevices--;
}

void wireInsertDevice(byte id, byte newDevice) {
  //Serial.println(id);

  if (numberI2CDevices<WIRE_MAX_DEVICES) {
    for (byte i=id+1; i<numberI2CDevices-1; i++) {
      wireDeviceID[i]=wireDeviceID[i+1];
    }
    wireDeviceID[id]=newDevice;
    numberI2CDevices++;
  } 
}

boolean wireDeviceExists(byte id) {
  for (byte i=0; i<numberI2CDevices; i++) {
    if (wireDeviceID[i]==id) return true;
  }
  return false; 
}


// We will combine flags in a byte. Using pointer does not seems to improve
// memory size so we don't use pointer
void setWireFlag(byte *aByte, byte address) {
  *aByte |= (1 << (address & 0b00000111));
}

void clearWireFlag(byte *aByte, byte address) {
  *aByte &= ~(1 << (address & 0b00000111));
}

boolean wireFlagStatus(byte *aByte, byte address) {
  return *aByte & (1 << (address & 0b00000111));
}

#endif
