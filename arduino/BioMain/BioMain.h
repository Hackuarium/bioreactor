/**************
  LIBRAIRIES
**************/
#include <NilRTOS.h> //MultiThread
#include <SPI.h>     //Flash SPI
#include <avr/wdt.h> //Watchdog


// #define SHOW_MENU_HELP 1 // if we don't show the help we spare a lot of memory


//Pin definition
#define D4   4  //temp probe
#define D5   5  //food OUT in v4.4
#define D6   6  //pid
#define D10  10 //memory select (before 4.4) or food IN in v4.4
#define D11  11 //slave at32u4 for LCD 
#define D12  12 //temp control
#define D13  13 //blink
#define D18  18 //stepper
#define D19  19 //stepper
#define D20  20 //food in (before 4.4)  or LoRa RST in 4.4
#define D21  21 //food out (before 4.4) or Flash select in 4.4
#define D22  22 //weight data
#define D23  23 //weight clock


#define STEPPER {8,9}

#define FOOD_CTRL          1
#define FOOD_IN            D10
#define FOOD_OUT           D5
#define WEIGHT_DATA        D22
#define WEIGHT_CLK         D23     //need to redefine the calibration parameters and process (see "HX711")

#define TEMP_LIQ         D4
#define TEMP_PCB         D12
#define TEMP_PID         D6
#define THR_MONITORING     1
#define MONITORING_LED   D13
#define LCD_SELECT       D11    //LCD screen SS_SPI

#define TEMPERATURE_CTRL   1
#define EVENT_LOGGING

/******************************
  SERIAL, LOGGER AND DEBUGGERS
*******************************/

#define THR_LINEAR_LOGS    1

//#define DEBUG_LOGS         1
//#define DEBUG_WEIGHT       1
//#define DEBUG_LCD          1
//#define DEBUG_ONEWIRE      1
//#define DEBUG_PID          1

#ifdef THR_LINEAR_LOGS
#define FLASH_SELECT A3 //Flash SS_SPI
#define LOG_INTERVAL 10  //Interval in (s) between logs logger
#endif




/*******************************
   CARD DEFINITION (HARD CODED)
 *******************************/
#ifdef STEPPER
#define PARAM_STEPPER_SPEED        26   // AA - motor speed, parameter S, IN RPM (v4.5)
#define PARAM_STEPPER_SECONDS      27   // AB   200 steps per full rotation (see Stepper.ino)
//      number of seconds before changing direction
#endif

#ifdef TEMPERATURE_CTRL
#define PARAM_TEMP_LIQ      0   // temperature of the solution
#define PARAM_TEMP_PCB      1   // temperature of the heating plate
#define PARAM_TEMP_PID      2   // heating amount of energy
#define PARAM_TEMP_TARGET   3   // target temperature of the liquid
#endif

/*************************************/

#if defined(WEIGHT_DATA) && defined(WEIGHT_CLK)
#define PARAM_WEIGHT                  4  // in unit of the balance
#define PARAM_WEIGHT_G                5  // in unit of the balance
#define PARAM_WEIGHT_SINCE_LAST_EVENT 6  // 
#define PARAM_WEIGHT_MIN              7  // 
#define PARAM_WEIGHT_MAX              8  // 
#define PARAM_SEDIMENTATION_TIME     31  // AF - MINUTES to wait without rotation before emptying
#define PARAM_FILLED_TIME            32  // AG - MINUTES to stay in the filled state
#define PARAM_WEIGHT_FACTOR          33  // AH - Weight calibration: conversion factor digital -> gr (weight=FACTOR*dig_unit)
#define PARAM_WEIGHT_OFFSET          34  // AI - Weight calibration: digital offset value when bioreactor is empty
#endif


/******************
   FLAG DEFINITION
 ******************/
#define PARAM_ERROR        24
#define FLAG_TEMP_PCB_PROBE_ERROR      0   // pcb probe failed (one wire not answering)
#define FLAG_TEMP_LIQ_PROBE_ERROR      1   // liquid probe failed (one wire not answering)
#define FLAG_TEMP_PCB_RANGE_ERROR      2   // temperature of pcb is outside range
#define FLAG_TEMP_LIQ_RANGE_ERROR      3   // temperature of liquid is outside range
#define FLAG_TEMP_TARGET_RANGE_ERROR   4   // target temperature is outside range
#define MASK_TEMP_ERROR                0b00011111  // where are the bit for temperature error

#define FLAG_WEIGHT_RANGE_ERROR        5   // the weight is outside range
#define MASK_WEIGHT_ERROR              0b00100000  // where are the bit for weight error



#define PARAM_STATUS             25  // currently active service
#define PARAM_ENABLED            51  // enabled service (set by user)
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



void writeLog(uint16_t event_number, int parameter_value);
boolean clearParameterBit(byte number, byte bitToClear);
void setupMemory();
void recoverLastEntryN();
uint8_t loadLastEntryToParameters();
uint16_t findSectorOfN( );
uint8_t toHex(Print* output, byte value);
uint8_t toHex(Print* output, int value);
uint8_t toHex(Print* output, long value);
