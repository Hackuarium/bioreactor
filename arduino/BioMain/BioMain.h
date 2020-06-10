#define STEPPER_DIRECTION  8
#define STEPPER_STEP       9

#define FOOD_IN            10
#define FOOD_OUT           5
#define WEIGHT_DATA        A1
#define WEIGHT_CLK         A0     //need to redefine the calibration parameters and process (see "HX711")


#define TEMP_LIQ           7
#define TEMP_PCB           A2
#define PID_CONTROL        6

#define THR_MONITORING     1
#define MONITORING_LED     13


#define EVENT_LOGGING  1

/******************************
  SERIAL, LOGGER AND DEBUGGERS
*******************************/

#define MAX_PARAM       52

#ifdef THR_SST_LOGGER
#define FLASH_SELECT      1 //Flash SS_SPI
#define LOG_INTERVAL      10  //Interval in (s) between logs logger
#endif

#define PARAM_STEPPER_SPEED        26   // AA - motor speed, parameter S, IN RPM (v4.5)
#define PARAM_STEPPER_SECONDS      27   // AB   number of seconds before changing direction
#define PARAM_STEPPER_WAIT         28   // AC   wait time in seconds between change of direction


#define PARAM_TEMP_LIQ      0   // A - temperature of the solution

#define PARAM_TEMP_PCB      1   // B - temperature of the heating plate
#define PARAM_TEMP_PID      2   // C - heating amount of energy
#define PARAM_TEMP_TARGET   3   // D - target temperature of the liquid



#define PARAM_WEIGHT                  4  // D - in unit of the balance
#define PARAM_WEIGHT_G                5  // E - in unit of the balance
#define PARAM_WAIT_SINCE_LAST_EVENT 6  // F
#define PARAM_WEIGHT_MIN              7  // G
#define PARAM_WEIGHT_MAX              8  // H
#define PARAM_SEDIMENTATION_TIME     31  // AF - MINUTES to wait without rotation before emptying
#define PARAM_FILLED_TIME            32  // AG - MINUTES to stay in the filled state
#define PARAM_WEIGHT_FACTOR          33  // AH - Weight calibration: conversion factor digital -> gr (weight=FACTOR*dig_unit)
#define PARAM_WEIGHT_OFFSET          34  // AI - Weight calibration: digital offset value when bioreactor is empty




/******************
   FLAG DEFINITION
 ******************/
#define PARAM_ERROR        24              // Y - errors
#define FLAG_TEMP_PCB_PROBE_ERROR      0   // pcb probe failed (one wire not answering)
#define FLAG_TEMP_LIQ_PROBE_ERROR      1   // liquid probe failed (one wire not answering)
#define FLAG_TEMP_PCB_RANGE_ERROR      2   // temperature of pcb is outside range
#define FLAG_TEMP_LIQ_RANGE_ERROR      3   // temperature of liquid is outside range
#define FLAG_TEMP_TARGET_RANGE_ERROR   4   // target temperature is outside range
#define MASK_TEMP_ERROR                0b00011111  // where are the bit for temperature error

#define FLAG_WEIGHT_RANGE_ERROR        5   // the weight is outside range
#define MASK_WEIGHT_ERROR              0b00100000  // where are the bit for weight error


#define PARAM_STATUS             25  // Z - currently active service
#define PARAM_ENABLED            51  // AZ - enabled service (set by user)
#define FLAG_STEPPER_CONTROL     0   //0 to stop engine
#define FLAG_FOOD_CONTROL        1   //1 for food ctrl
#define FLAG_PID_CONTROL         2   //0 to stop PID

#define FLAG_PH_CONTROL          3   //0 to to stop ph
#define FLAG_GAS_CONTROL         4   //0 to stop gas

#define FLAG_SEDIMENTATION       7
#define FLAG_RELAY_FILLING       8
#define FLAG_RELAY_EMPTYING      9

#define FLAG_PH_CALIBRATE        11
#define FLAG_RELAY_ACID          12
#define FLAG_RELAY_BASE          13

#include "libino/hack.h"

void writeLog(uint16_t event_number, int parameter_value);
boolean clearParameterBit(byte number, byte bitToClear);
void setupMemory();
void recoverLastEntryN();
uint8_t loadLastEntryToParameters();
uint16_t findSectorOfN( );
