#ifdef THR_STEPPER
/****************************
    THREAD STEPPER MOTOR

    The last verison use a stepper driver and therefore we may simply use a Timer to generate
    an impulsion at a very precise time frame.
 ******************************/

#include "libino/TimerOne/TimerOne.cpp"

#define MIN_STEPPER_SPEED 5   // RPM
#define MAX_STEPPER_SPEED 90 // RPM

//--------------- IS STEPPER STOPPED ---------------//

boolean isStepperStopped() {
  // temp code to TEST
  return false;

  if (! isRunning(FLAG_STEPPER_CONTROL) || ! isEnabled(FLAG_STEPPER_CONTROL)) { // PID is disabled
    return true;
  }

  if (isError()) { // any error we should stop heating !
    return true;
  }

  if (isRunning(FLAG_RELAY_EMPTYING) || isRunning(FLAG_SEDIMENTATION)) {
    return true;
  }
  return false;
}

//--------------- STEPPER THREAD ---------------//

NIL_WORKING_AREA(waThreadStepper, 16);
NIL_THREAD(ThreadStepper, arg) {
  nilThdSleepMilliseconds(4000);
  boolean forward = true;
  uint8_t count = 0;

  pinMode(STEPPER_DIRECTION, OUTPUT);
  pinMode(STEPPER_STEP, OUTPUT);
  // The stepper motor recquires 3200 steps in order to do a full rotation

  Timer1.initialize(1000000 / 3200); // 5000ms  = 40 Hz
  Timer1.pwm(STEPPER_STEP, 512);
  Timer1.stop();

  while (true) {
    //first a check is performed on the motor status

    if (forward) {
      digitalWrite(STEPPER_DIRECTION, HIGH);
    } else {
      digitalWrite(STEPPER_DIRECTION, LOW);
    }
    for (int i = 0; i < getParameter(PARAM_STEPPER_SECONDS); i++) {
      int speed = getParameter(PARAM_STEPPER_SPEED);
      if (speed < MIN_STEPPER_SPEED) setParameter(PARAM_STEPPER_SPEED, MIN_STEPPER_SPEED);
      if (speed > MAX_STEPPER_SPEED) setParameter(PARAM_STEPPER_SPEED, MAX_STEPPER_SPEED);
      if (isStepperStopped()) {
        Timer1.stop();
        break;
      }
      Timer1.setPeriod(1000000 / 3200 / getParameter(PARAM_STEPPER_SPEED) * 60);
      Timer1.start();
      nilThdSleepMilliseconds(1000);
    }
    Timer1.stop();

    forward = !forward;
    nilThdSleepMilliseconds(1000);
  }
}

#endif
