#define ERROR_VALUE  -32768



void resetParameters() {

  int active = 0;

#ifdef THR_STEPPER
  active |= 1 << FLAG_STEPPER_CONTROL;
  setAndSaveParameter(PARAM_STEPPER_SPEED, 60);
  setAndSaveParameter(PARAM_STEPPER_SECONDS, 30);
#endif

#ifdef THR_ONEWIRE
  active |= 1 << FLAG_PID_CONTROL;
  setAndSaveParameter(PARAM_TEMP_LIQ, ERROR_VALUE);
  setAndSaveParameter(PARAM_TEMP_PCB, ERROR_VALUE);
  setAndSaveParameter(PARAM_TEMP_TARGET, 3000);
#endif

#if defined(FOOD_IN) || defined(FOOD_OUT)
  active |= 1 << FLAG_FOOD_CONTROL;
  setAndSaveParameter(PARAM_WEIGHT_MIN, 32767);
  setAndSaveParameter(PARAM_WEIGHT_MAX, -32768);
  setAndSaveParameter(PARAM_SEDIMENTATION_TIME, 30);
  setAndSaveParameter(PARAM_FILLED_TIME, 30);
  setAndSaveParameter(PARAM_WEIGHT_FACTOR, 0);
  setAndSaveParameter(PARAM_WEIGHT_OFFSET, 0);
#endif

#ifdef PH_CTRL
  active |= 1 << FLAG_PH_CONTROL;
  setAndSaveParameter(PARAM_TARGET_PH, 700);
  setAndSaveParameter(PARAM_PH_FACTOR_A, -6685);
  setAndSaveParameter(PARAM_PH_FACTOR_B, -2170);
  setAndSaveParameter(PARAM_PH_STATE, 0);
  setAndSaveParameter(PARAM_PH_ADJUST_DELAY, 10);
  setAndSaveParameter(PARAM_PH_OPENING_TIME, 1);
  setAndSaveParameter(PARAM_PH_TOLERANCE, 10);
  setAndSaveParameter(PARAM_REF_PH4, 4000);
  setAndSaveParameter(PARAM_REF_PH7, 7000);
  setAndSaveParameter(PARAM_REF_PH10, 10000);

#endif

#ifdef TAP_GAS1
  setAndSaveParameter(PARAM_FLUX_GAS1, ERROR_VALUE);
  setAndSaveParameter(PARAM_DESIRED_FLUX_GAS1, ERROR_VALUE);
  setAndSaveParameter(PARAM_ANEMO_OFFSET1, 0);
  setAndSaveParameter(PARAM_ANEMO_FACTOR1, 100);
#endif
#ifdef TAP_GAS2
  setAndSaveParameter(PARAM_FLUX_GAS2, ERROR_VALUE);
  setAndSaveParameter(PARAM_DESIRED_FLUX_GAS2, ERROR_VALUE);
  setAndSaveParameter(PARAM_ANEMO_OFFSET2, 0);
  setAndSaveParameter(PARAM_ANEMO_FACTOR2, 100);
#endif
#ifdef TAP_GAS3
  setAndSaveParameter(PARAM_FLUX_GAS3, ERROR_VALUE);
  setAndSaveParameter(PARAM_DESIRED_FLUX_GAS3, ERROR_VALUE);
  setAndSaveParameter(PARAM_ANEMO_OFFSET3, 0);
  setAndSaveParameter(PARAM_ANEMO_FACTOR3, 100);
#endif
#ifdef TAP_GAS4
  setAndSaveParameter(PARAM_FLUX_GAS4, ERROR_VALUE);
  setAndSaveParameter(PARAM_DESIRED_FLUX_GAS4, ERROR_VALUE);
  setAndSaveParameter(PARAM_ANEMO_OFFSET4, 0);
  setAndSaveParameter(PARAM_ANEMO_FACTOR4, 100);
#endif
#ifdef GAS_CTRL
  active |= 1 << FLAG_GAS_CONTROL;
  setAndSaveParameter(PARAM_FLUX_TOLERANCE, 100);
  setAndSaveParameter(PARAM_FLUX_TIME_WINDOWS, 10);
#endif

  setAndSaveParameter(PARAM_STATUS, active);
  setAndSaveParameter(PARAM_ENABLED, active);
  setAndSaveParameter(PARAM_ERROR, 0);
}
