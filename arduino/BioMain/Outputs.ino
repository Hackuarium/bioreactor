#if defined(THR_OUTPUTS)

NIL_WORKING_AREA(waThreadOutputs, 0); 

NIL_THREAD(ThreadOutputs, arg) {
  nilThdSleepMilliseconds(2234); // wait a little bit not everything starts at once

  while (true) {
    nilThdSleepMilliseconds(1000);

#ifdef OUT_1
    pinMode(OUT_1, OUTPUT);
    digitalWrite(OUT_1, getStatus(FLAG_OUTPUT_1) && isEnabled(FLAG_OUTPUT_1));
#endif
#ifdef OUT_2
    pinMode(OUT_2, OUTPUT);
    digitalWrite(OUT_2, getStatus(FLAG_OUTPUT_2) && isEnabled(FLAG_OUTPUT_2));
#endif
#ifdef OUT_3
    pinMode(OUT_3, OUTPUT);
    digitalWrite(OUT_3, getStatus(FLAG_OUTPUT_3) && isEnabled(FLAG_OUTPUT_3));
#endif
#ifdef OUT_4
    pinMode(OUT_4, OUTPUT);
    digitalWrite(OUT_4, getStatus(FLAG_OUTPUT_4) && isEnabled(FLAG_OUTPUT_4));
#endif
  }
}

#endif
