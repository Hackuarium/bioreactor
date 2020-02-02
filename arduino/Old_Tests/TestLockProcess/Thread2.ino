

NIL_WORKING_AREA(waThread2, 400);
NIL_THREAD(Thread2, arg) {

	while (true) {
		waitLock();

                nilThdSleepMilliseconds(waitTime);
		Serial.println("Block thread 2");

		delay(waitTime);
		Serial.println("Thread 2");
		delay(waitTime);

		nilThdSleepMilliseconds(waitTime);

		Serial.println("Release thread 2");

              nilThdSleepMilliseconds(waitTime);

		lockTimeCriticalZone=false;

                nilThdSleepMilliseconds(waitTime);
	}


}










