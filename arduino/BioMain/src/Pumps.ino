#if defined(THR_PUMPS) && defined( THR_WEIGHT)

NIL_WORKING_AREA(waThreadPumps, 0); 

NIL_THREAD(ThreadPumps, arg) {
  nilThdSleepMilliseconds(2234); // wait a little bit not everything starts at once

  while (true) {
    nilThdSleepMilliseconds(1000);

#ifdef FOOD_IN
    pinMode(FOOD_IN, OUTPUT);
    digitalWrite(FOOD_IN, getStatus(FLAG_RELAY_FILLING));
#endif
#ifdef FOOD_OUT
    pinMode(FOOD_OUT, OUTPUT);
    digitalWrite(FOOD_OUT, getStatus(FLAG_RELAY_EMPTYING));
#endif
  }
}

#endif
