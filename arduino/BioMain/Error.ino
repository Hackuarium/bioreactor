#ifdef THR_ERROR


NIL_WORKING_AREA(waThreadError, 0); //tune the allocated mem (here extra is provided)
NIL_THREAD(ThreadError, arg)
{
  nilThdSleepMilliseconds(4520);
  pinMode(OUT_ERROR, OUTPUT);
  byte errorCounter = 0;
  while (true) {
    if (getParameter(PARAM_ERROR) && errorCounter % 2) {
      digitalWrite(OUT_ERROR, HIGH);
    } else {
      digitalWrite(OUT_ERROR, LOW);
    }
    errorCounter++;
    nilThdSleepMilliseconds(1000);
  }
}

#endif
