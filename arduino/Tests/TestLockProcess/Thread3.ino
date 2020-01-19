NIL_WORKING_AREA(waThread3, 400);
NIL_THREAD(Thread3, arg) {

	while(true) {
		waitLock();


                nilThdSleepMilliseconds(waitTime);
		Serial.println("Block thread 3");

		delay(waitTime);
		Serial.println("Thread 3");
		delay(waitTime);

		nilThdSleepMilliseconds(waitTime);

		Serial.println("Release thread 3");

                 nilThdSleepMilliseconds(waitTime);

		lockTimeCriticalZone=false;

                nilThdSleepMilliseconds(waitTime);
	}


}










