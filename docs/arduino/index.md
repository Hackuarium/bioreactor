# Installation

## Cloning the project

You know with age we take some habits and it would be easier if you follow the same one ...

All our github projects are always in a folder called `git`
that is at the first level of the home directory. It is followed by the 
name of the github user/organisation and finaly the project.

So to install the project from bash:
```
mkdir -p ~/git/bioreactor/
cd ~/git/bioreactor/
git clone git@github.com:Bioreactor/Bioreactor_v4.git
```

The possiblity to clone the project will require that you have validate your public key
in github !

## Installing the Arduino IDE

Currently we are still using the Arduino IDE. Plase download the last 1.6 version
of the program from: https://www.arduino.cc/en/Main/Software

## Another IDE ...

You can also use VScode with the Arduino plugin.

## Hardware support for Leonardo 8MHz = Lilipad Arduino USB

The version 4.2 of the bioreactor is opeerating at 8MHz/3V3 instead of the standard 16MHz/5V.
In order to have the correct boadloader just use Lilipad Arduino USB as board.

If you do any mistake and try to pretend it is a normal Leonardo, you will be able to flash the program but the USB port will not be recognized. You will have to reflash the bootleader !!!```

## Using USBtiny
By default the last version of Fedora will only give you a USB readonly access and will prevent to burn the board loader.
In order for the USBTiny to have r/w access you should add a USB rules:
```
# UDEV rule for Arduino ISP R3 programmer board,
# to prevent having to run Arduino IDE as root to get it to program.
# Copy this file to /etc/udev/rules.d so

SUBSYSTEMS=="usb", ATTRS{idVendor}=="1781", ATTRS{idProduct}=="0c9f", GROUP="plugdev", MODE="0666"

```


## Libraries

In this project we use many non standard libraries. By default the Arduino IDE
will look for them in `~/Arduino/libraries`

If you are using only our project it is easier to directly point this folder
to the libraries that are present in the github. 

```
mkdir ~/Arduino/
ln -s ~/git/bioreactor/Bioreactor_v4/Arduino/libraries/ ~/Arduino/
```
Attention: Time library update v1.5.0 change commited in BioMain including TimeLib.h instead of Time.h resolves bugs on OSX 

## That's it

You should now be able to compile the project from the Arduino IDE.
You can now proceed burning the bootloader using the Leonardo 8MHz newly created option and upload your code selecting the same Leonardo 8MHz in the list of available MCUs from the IDE. To do so, you must select the Leonardo 8MHz board under /Tools/Boards/ in the Arduino IDE or selecting the proper device during project creation in Eclipse. Note that the LCD board works under 16MHz/5V and must be flashed as a standard Leonardo board not a 8MHz one. You must also select the right board version when programming the board via USB !


# The parameters

In order to control the bioreactor you should have a look to the description of the [parameters](parameters.md).
