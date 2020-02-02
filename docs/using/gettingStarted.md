Starting a new bioreactor
=========================

When you have a new bioreactor you should start by configuring it. You may connect using a
terminal through the serial port.

You may as well use the arduino application to directly connect to the bioreactor through serial.
The menu is accessible using the `h` instruction but you should not forget to add a CR + LF after each
instruction.

Initializing parameters
-----------------------

Connect via the terminal and reset all the parameters to the default parameters

`r1234`

It is also important to set a unique qualifier for the bioreactor. You should fill the [list](qualifiers.md) with a free
code.


Setup the weight
----------------

There is now a special menu for the weight calibration `w`.

You should do the following step in order to callibrate the weight:

1. Empty bioreactor : `we`
2. Empty bioreactor + 1kg : `wk`
3. Bioreactor filled at low level : `wl`
4. Bioreactor filled at high level : `wh`

You may now check the reproducibility and the weight in g of any object using `wt`

It is important to note that an error (stored in [PARAM_ERROR](/arduino/parameters#PARAM_ERROR) will be generated if
the weight is either 20% under the minimal value or 20% over the maximal value and this should stop all the functions.

The main parameters
-------------------

In order to activate the bioreactor you need to enable functions. Currently there are 3 functions
* agitation (value 1)
* food contorl (value 2)
* temperature control (value 3)

You may enable the functionnablities by setting the parameter `AZ`. To activate all the functionnalities
enter `AZ7`.

