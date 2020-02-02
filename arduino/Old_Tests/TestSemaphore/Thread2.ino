

NIL_WORKING_AREA(waThread2, 0);
NIL_THREAD(Thread2, arg) {

	while (true) {
		nilSemWait(&lockTimeCriticalZone);
                delay(1000);
		Serial.println("Block thread 2");

		delay(1000);
		Serial.println("Thread 2");
		delay(1000);

		nilThdSleepMilliseconds(1000);

		Serial.println("Release thread 2");

               delay(1000);

		nilSemSignal(&lockTimeCriticalZone);

                nilThdSleepMilliseconds(1000);
	}


}










