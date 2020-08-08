#define ERROR_VALUE  -32768



void resetParameters() {

  int active = 0;

#ifdef THR_STEPPER
  active |= 1 << FLAG_STEPPER_CONTROL;
  setAndSaveParameter(PARAM_STEPPER_SPEED, 60);
  setAndSaveParameter(PARAM_STEPPER_SECONDS, 30);
  setAndSaveParameter(PARAM_STEPPER_WAIT, 5);
#endif

#ifdef THR_ONEWIRE
  active |= 1 << FLAG_PID_CONTROL;
  setAndSaveParameter(PARAM_TEMP_EXT1, ERROR_VALUE);
  setAndSaveParameter(PARAM_TEMP_EXT2, ERROR_VALUE);
  setAndSaveParameter(PARAM_TEMP_PCB, ERROR_VALUE);
  setAndSaveParameter(PARAM_TEMP_TARGET, 3000);
#endif

#if defined(OUT_1) || defined(OUT_2)
  active |= 1 << FLAG_OUTPUT_CONTROL;
  setAndSaveParameter(PARAM_WEIGHT_MIN, 32767);
  setAndSaveParameter(PARAM_WEIGHT_MAX, -32768);
  setAndSaveParameter(PARAM_SEDIMENTATION_TIME, 30);
  setAndSaveParameter(PARAM_FILLED_TIME, 30);
  setAndSaveParameter(PARAM_WEIGHT_FACTOR, 0);
  setAndSaveParameter(PARAM_WEIGHT_OFFSET, 0);
#endif


  setAndSaveParameter(PARAM_STATUS, active);
  setAndSaveParameter(PARAM_ENABLED, active);
  setAndSaveParameter(PARAM_ERROR, 0);
}
