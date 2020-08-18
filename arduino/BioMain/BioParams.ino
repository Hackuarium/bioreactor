#define ERROR_VALUE  -32768



void resetParameters() {

  setAndSaveParameter(PARAM_STEPPER_SPEED, 60);
  setAndSaveParameter(PARAM_STEPPER_SECONDS, 30);
  setAndSaveParameter(PARAM_STEPPER_WAIT, 5);

  setAndSaveParameter(PARAM_TEMP_EXT1, ERROR_VALUE);
  setAndSaveParameter(PARAM_TEMP_EXT2, ERROR_VALUE);
  setAndSaveParameter(PARAM_TEMP_PCB, ERROR_VALUE);
  setAndSaveParameter(PARAM_TEMP_TARGET, 3000);

  setAndSaveParameter(PARAM_WEIGHT_MIN, 32767);
  setAndSaveParameter(PARAM_WEIGHT_MAX, -32768);
  setAndSaveParameter(PARAM_WEIGHT_FACTOR, 0);
  setAndSaveParameter(PARAM_WEIGHT_OFFSET, 0);

  setAndSaveParameter(PARAM_CURRENT_STEP, 0);
  setAndSaveParameter(PARAM_CURRENT_WAIT_TIME, 0);
  for (byte i = FIRST_STEP_PARAMETER; i <= LAST_STEP_PARAMETER; i++) {
    setAndSaveParameter(i, 0);
  }

  int active = 1 << FLAG_STEPPER_CONTROL | 1 << FLAG_PID_CONTROL | 1 << FLAG_OUTPUT_1 | 1 << FLAG_OUTPUT_2 | 1 << FLAG_OUTPUT_3 | 1 << FLAG_OUTPUT_4;

  setAndSaveParameter(PARAM_STATUS, active);
  setAndSaveParameter(PARAM_ENABLED, active);
  setAndSaveParameter(PARAM_ERROR, 0);
}
