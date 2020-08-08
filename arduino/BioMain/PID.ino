#ifdef THR_PID

#include "libino/PID/PID_v1.h"



#ifdef THR_ONEWIRE

#define SAFETY_MAX_PCB_TEMP 7000  // pcb temperature is max 70°C
#define SAFETY_MIN_PCB_TEMP 1000  // pcb temperatire is min 10°C
#define SAFETY_MAX_LIQ_TEMP 6000  // liquid temperature is max 60°C
#define SAFETY_MIN_LIQ_TEMP 1000  // liquid temperature is min 10°C

#define PID_OUTPUT_LIMIT    200  //200 is ~80% of max PWM --> Limits max avg power to ~8A

void pid_ctrl();
void heatingSetup();

double heatingRegInput;
double heatingRegOutput;
double heatingRegSetpoint;
//Specify the heating regulation links and initial tuning parameters
PID heatingRegPID(&heatingRegInput, &heatingRegOutput, &heatingRegSetpoint, 1, 0.0002, 5, DIRECT);

NIL_WORKING_AREA(waThreadPID, 120); //tune the allocated mem (here extra is provided)
NIL_THREAD(ThreadPID, arg)
{
  nilThdSleepMilliseconds(5000);
  pinMode(PID_CONTROL, OUTPUT);
  heatingSetup();

  while (true) {
    pid_ctrl();
    nilThdSleepMilliseconds(500);  //refresh every 500ms --> the faster the better the control
  }
}

/*Temperature PID Control addressing relay*/

void pid_ctrl() {
  saveAndLogError(getParameter(PARAM_TEMP_EXT1) < SAFETY_MIN_LIQ_TEMP || getParameter(PARAM_TEMP_EXT1) > SAFETY_MAX_LIQ_TEMP, FLAG_TEMP_EXT1_RANGE_ERROR);
  saveAndLogError(getParameter(PARAM_TEMP_EXT2) < SAFETY_MIN_LIQ_TEMP || getParameter(PARAM_TEMP_EXT2) > SAFETY_MAX_LIQ_TEMP, FLAG_TEMP_EXT2_RANGE_ERROR);
  saveAndLogError(getParameter(PARAM_TEMP_PCB) < SAFETY_MIN_PCB_TEMP || getParameter(PARAM_TEMP_PCB) > SAFETY_MAX_PCB_TEMP, FLAG_TEMP_PCB_RANGE_ERROR);
  saveAndLogError(getParameter(PARAM_TEMP_TARGET) < SAFETY_MIN_LIQ_TEMP || getParameter(PARAM_TEMP_TARGET) > SAFETY_MAX_LIQ_TEMP, FLAG_TEMP_TARGET_RANGE_ERROR);

  if (! isRunning(FLAG_PID_CONTROL) || ! isEnabled(FLAG_PID_CONTROL)) { // PID is disabled
    analogWrite(PID_CONTROL, 0);
    return;
  }

  if (isError()) { // any error we should stop heating !
    analogWrite(PID_CONTROL, 0);
    return;
  }

  if (isRunning(FLAG_SEDIMENTATION) || isRunning(FLAG_RELAY_EMPTYING)) { // when it is in sedimentation or emptying mode we stop the heating
    analogWrite(PID_CONTROL, 0);
    return;
  }


  heatingRegInput =max( getParameter(PARAM_TEMP_EXT1), getParameter(PARAM_TEMP_EXT2));
  heatingRegSetpoint = getParameter(PARAM_TEMP_TARGET);
  heatingRegPID.Compute();                                   // the computation takes only 30ms!
  setParameter(PARAM_TEMP_PID, heatingRegOutput);
  analogWrite(PID_CONTROL, heatingRegOutput);
}

// see the rest of oliver's code for sanity checks
void heatingSetup()
{
  //tell the PID to range between 0 and the full window size
  heatingRegPID.SetOutputLimits(0, PID_OUTPUT_LIMIT);
  heatingRegPID.SetMode(AUTOMATIC);      //turn the PID on, cf. PID library
  heatingRegPID.SetSampleTime(950);      //set PID sampling time to 450ms
}

#endif
#endif
