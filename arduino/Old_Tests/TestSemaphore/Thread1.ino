NIL_WORKING_AREA(waThread1, 0);
NIL_THREAD(Thread1, arg) {

	while (true) {
		nilSemWait(&lockTimeCriticalZone);

                delay(1000);
		Serial.println("Block thread 1");

		delay(1000);
		Serial.println("Thread 1");
		delay(1000);

		nilThdSleepMilliseconds(1000);

		Serial.println("Release thread 1");

                 delay(1000);

		nilSemSignal(&lockTimeCriticalZone);

                nilThdSleepMilliseconds(1000);
	}
}

