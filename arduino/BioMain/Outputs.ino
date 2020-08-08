#if defined(THR_PUMPS) && defined( THR_WEIGHT)

NIL_WORKING_AREA(waThreadPumps, 0); 

NIL_THREAD(ThreadPumps, arg) {
  nilThdSleepMilliseconds(2234); // wait a little bit not everything starts at once

  while (true) {
    nilThdSleepMilliseconds(1000);

#ifdef OUT_1
    pinMode(OUT_1, OUTPUT);
    digitalWrite(OUT_1, getStatus(FLAG_RELAY_FILLING));
#endif
#ifdef OUT_2
    pinMode(OUT_2, OUTPUT);
    digitalWrite(OUT_2, getStatus(FLAG_RELAY_EMPTYING));
#endif
#ifdef OUT_3
    pinMode(OUT_3, OUTPUT);
    digitalWrite(OUT_3, getStatus(FLAG_RELAY_EMPTYING));
#endif
#ifdef OUT_4
    pinMode(OUT_4, OUTPUT);
    digitalWrite(OUT_4, getStatus(FLAG_RELAY_EMPTYING));
#endif
  }
}

#endif
