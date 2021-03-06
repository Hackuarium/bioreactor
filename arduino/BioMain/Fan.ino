#ifdef THR_FAN


NIL_WORKING_AREA(waThreadFan, 0); //tune the allocated mem (here extra is provided)
NIL_THREAD(ThreadFan, arg)
{
  nilThdSleepMilliseconds(1000);
  pinMode(OUT_FAN, OUTPUT);


  while (true) {
    setFan();
    nilThdSleepMilliseconds(2000); 
  }
}

/*Temperature PID Control addressing relay*/

void setFan() {
  int temperature = getParameter(PARAM_TEMP_PCB);
  if (temperature > 3500) {
    analogWrite(OUT_FAN, 255);
  } else {
    analogWrite(OUT_FAN, 0);
  }

}

#endif
