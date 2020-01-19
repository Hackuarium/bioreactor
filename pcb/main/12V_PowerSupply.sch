EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 17
Title "Bertha"
Date "2019-12-03"
Rev ""
Comp "Hackuarium"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Bertha_main-eagle-import:JACK_DC_BARREL U201
U 1 1 5DF48B64
P 5440 3815
F 0 "U201" H 5490 3865 50  0001 C CNN
F 1 "JACK_DC_BARREL" H 5440 3815 50  0001 C CNN
F 2 "" H 5440 3815 50  0001 C CNN
F 3 "" H 5440 3815 50  0001 C CNN
	1    5440 3815
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5440 4215 5440 4270
Text GLabel 5010 3815 0    50   Input ~ 0
12V
Wire Wire Line
	5010 3815 5170 3815
Text GLabel 5040 4270 0    50   Input ~ 0
GND
Wire Wire Line
	5040 4270 5440 4270
Text Notes 7075 7025 0    315  ~ 0
Power Supply
$EndSCHEMATC
