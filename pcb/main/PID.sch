EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 15 17
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
L Bertha_main-eagle-import:JACK_DC_BARREL U1501
U 1 1 5DE7E178
P 6000 3525
F 0 "U1501" H 6050 3575 50  0001 C CNN
F 1 "JACK_DC_BARREL" H 6000 3525 50  0001 C CNN
F 2 "" H 6000 3525 50  0001 C CNN
F 3 "" H 6000 3525 50  0001 C CNN
	1    6000 3525
	0    -1   -1   0   
$EndComp
$Comp
L Bertha_main-eagle-import:IRF3704S Q1501
U 1 1 5DE7EEAB
P 5625 4225
F 0 "Q1501" H 5823 4278 59  0000 L CNN
F 1 "IRF3704S" H 5823 4173 59  0000 L CNN
F 2 "" H 5625 4225 50  0001 C CNN
F 3 "" H 5625 4225 50  0001 C CNN
	1    5625 4225
	1    0    0    -1  
$EndComp
$Comp
L Bertha_main-eagle-import:LEDCHIP-LED0805 LED1501
U 1 1 5DE81797
P 5525 4625
F 0 "LED1501" V 5725 4600 59  0000 C CNN
F 1 "LEDCHIP-LED0805" V 5625 4600 59  0000 C CNN
F 2 "" H 5525 4625 50  0001 C CNN
F 3 "" H 5525 4625 50  0001 C CNN
	1    5525 4625
	0    -1   1    0   
$EndComp
Text GLabel 6100 3925 2    50   Input ~ 0
12V
Text GLabel 6000 4625 2    50   Input ~ 0
GND
Text GLabel 4900 4325 0    50   Input ~ 0
D6
$Comp
L Device:R R1501
U 1 1 5DE845AD
P 5175 4475
F 0 "R1501" V 5100 4350 50  0000 L CNN
F 1 "10k" V 5175 4400 50  0000 L CNN
F 2 "" V 5105 4475 50  0001 C CNN
F 3 "~" H 5175 4475 50  0001 C CNN
	1    5175 4475
	1    0    0    -1  
$EndComp
Wire Wire Line
	5725 4425 5725 4625
Wire Wire Line
	5725 4625 6000 4625
Connection ~ 5725 4625
Wire Wire Line
	5425 4625 5175 4625
Wire Wire Line
	5175 4325 5525 4325
Wire Wire Line
	5725 3525 5725 4025
Wire Wire Line
	6000 3925 6100 3925
Wire Wire Line
	4900 4325 5175 4325
Connection ~ 5175 4325
Text Notes 8600 7050 0    315  ~ 0
PID
$EndSCHEMATC
