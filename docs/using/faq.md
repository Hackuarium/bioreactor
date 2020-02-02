Frequently asked question (FAQ)
===============================

Is the bioreactor rebooting ?
-----------------------------

In case the lower priority process can not be reached during 8s, the bioreactor will restart
automatically. This lower priority process is the one that takes care of blinking the
led.

Using the command `p` you will get the uptime in milliseconds.

In the of reboot there is also an entry in the log.

What is the state of the bioreactor ?
-------------------------------------

The command `t` will give you a good overview about the current state of the bioreactor

Status: 519 - What is the current status
- 0: 1 - agitation control
- 1: 1 - food control
- 2: 1 - heating
- 7: 0 - sedimentation
- 8: 0 - filling pump
- 9: 1 - emptying pump


Enabled: 7 - What is currently enabled
- 0: 1 - agitation control
- 1: 1 - food control
- 2: 1 - heating

Error: 0 - What are the current errors
- 0: 0 - pcb probe failed (one wire not answering)
- 1: 0 - liquid probe failed (one wire not answering)
- 2: 0 - temperature of pcb is outside range
- 3: 0 - temperature of liquid is outside range
- 4: 0 - target temperature is outside range
- 5: 0 - weight is outside range

What is a cycle ?
-----------------

The bioreactor has 4 different phases :

Mode               | Heating | Stepper | Till when it last
-------------------|---------|---------|----------------------------------------
Normal mode        |   On    |   On    | Last `PARAM_FILLED_TIME` minutes
Sedimentation mode |   Off   |   Off   | Last `PARAM_SEDIMENTATION_TIME` minutes
Pumping out        |   Off   |   Off   | Last till `PARAM_WEIGHT_MIN` is reached
Pumping in         |   On    |   On    | Last till `PARAM_WEIGHT_MAX` is reached