NIL_WORKING_AREA(waThread1, 400);
NIL_THREAD(Thread1, arg) {

	while (true) {
		waitLock();

                nilThdSleepMilliseconds(waitTime);
		Serial.println("Block thread 1");

		delay(waitTime);
		Serial.println("Thread 1");
		delay(waitTime);

		nilThdSleepMilliseconds(waitTime);

		Serial.println("Release thread 1");

                nilThdSleepMilliseconds(waitTime);

		lockTimeCriticalZone=false;

                nilThdSleepMilliseconds(waitTime);
	}
}

