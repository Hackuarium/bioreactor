NIL_WORKING_AREA(waThread3, 0);
NIL_THREAD(Thread3, arg) {

	while(true) {
		nilSemWait(&lockTimeCriticalZone);


                delay(1000);
		Serial.println("Block thread 3");

		delay(1000);
		Serial.println("Thread 3");
		delay(1000);

		nilThdSleepMilliseconds(1000);

		Serial.println("Release thread 3");

                 delay(1000);

		nilSemSignal(&lockTimeCriticalZone);

                nilThdSleepMilliseconds(1000);
	}


}










