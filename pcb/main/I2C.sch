EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 17
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
L Bertha_main-eagle-import:RJ12RIGHTANGLE-I2C J601
U 1 1 5DE4F3C7
P 6000 3400
F 0 "J601" H 6332 3423 59  0000 L CNN
F 1 "RJ12RIGHTANGLE-I2C" H 6332 3318 59  0000 L CNN
F 2 "" H 6000 3400 50  0001 C CNN
F 3 "" H 6000 3400 50  0001 C CNN
	1    6000 3400
	1    0    0    -1  
$EndComp
$Comp
L Bertha_main-eagle-import:RJ12RIGHTANGLE-I2C J602
U 1 1 5DE50AB9
P 6000 4225
F 0 "J602" H 6332 4248 59  0000 L CNN
F 1 "RJ12RIGHTANGLE-I2C" H 6332 4143 59  0000 L CNN
F 2 "" H 6000 4225 50  0001 C CNN
F 3 "" H 6000 4225 50  0001 C CNN
	1    6000 4225
	1    0    0    -1  
$EndComp
Text GLabel 5600 3600 0    50   Input ~ 0
GND
Text GLabel 5600 4450 0    50   Input ~ 0
GND
Wire Wire Line
	5600 4450 5700 4450
Wire Wire Line
	5700 4450 5700 4325
Wire Wire Line
	5700 4325 5900 4325
Wire Wire Line
	5700 4450 5700 4525
Wire Wire Line
	5700 4525 5900 4525
Connection ~ 5700 4450
Wire Wire Line
	5600 3600 5700 3600
Wire Wire Line
	5700 3600 5700 3500
Wire Wire Line
	5700 3500 5900 3500
Wire Wire Line
	5700 3600 5700 3700
Wire Wire Line
	5700 3700 5900 3700
Connection ~ 5700 3600
Text GLabel 5575 4225 0    50   Input ~ 0
SDA
Text GLabel 5575 4125 0    50   Input ~ 0
SCL
Text GLabel 5575 4025 0    50   Input ~ 0
12V
Wire Wire Line
	5575 4125 5900 4125
Wire Wire Line
	5900 4225 5575 4225
Wire Wire Line
	5575 4025 5900 4025
Text GLabel 5350 3400 0    50   Input ~ 0
SDA
Text GLabel 5350 3300 0    50   Input ~ 0
SCL
Wire Wire Line
	5350 3300 5700 3300
Wire Wire Line
	5350 3400 5475 3400
$Comp
L Device:R R601
U 1 1 5DE60560
P 5475 3250
F 0 "R601" V 5550 3250 50  0000 L CNN
F 1 "10k" V 5475 3200 50  0000 L CNN
F 2 "" V 5405 3250 50  0001 C CNN
F 3 "~" H 5475 3250 50  0001 C CNN
	1    5475 3250
	1    0    0    -1  
$EndComp
Connection ~ 5475 3400
Wire Wire Line
	5475 3400 5900 3400
$Comp
L Device:R R602
U 1 1 5DE6123D
P 5700 3150
F 0 "R602" V 5775 3125 50  0000 L CNN
F 1 "10k" V 5700 3075 50  0000 L CNN
F 2 "" V 5630 3150 50  0001 C CNN
F 3 "~" H 5700 3150 50  0001 C CNN
	1    5700 3150
	1    0    0    -1  
$EndComp
Connection ~ 5700 3300
Wire Wire Line
	5700 3300 5900 3300
Text GLabel 5900 3000 2    50   Input ~ 0
12V
Text GLabel 5375 3000 0    50   Input ~ 0
3.3V
Wire Wire Line
	5375 3000 5475 3000
Wire Wire Line
	5475 3100 5475 3000
Connection ~ 5475 3000
Wire Wire Line
	5475 3000 5700 3000
Wire Wire Line
	5900 3000 5900 3200
Text Notes 8675 7050 0    315  ~ 0
I2C\n
$EndSCHEMATC
