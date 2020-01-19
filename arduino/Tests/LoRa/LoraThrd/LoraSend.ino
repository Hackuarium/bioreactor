#define THR_LORA_SEND 1

#ifdef THR_LORA_SEND

NIL_WORKING_AREA(waThreadLoraSend, 0);
NIL_THREAD(ThreadLoraSend, arg) {
  resetLora(&Serial);
  initLora(&Serial);
  while (TRUE) {
    char buf [5];
    sprintf (buf, "%05i", getParameter(PARAM_TEMP_1));
    sendLoraMessage(buf, &Serial);
    
    for (int i=0; i<300; i++) {
      nilThdSleepMilliseconds(1000);
    }
  }

}

#endif




