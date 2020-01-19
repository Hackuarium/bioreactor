EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
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
L Device:R R26
U 1 1 5DE665B4
P 5200 3875
F 0 "R26" V 5125 3875 50  0000 C CNN
F 1 "1k" V 5200 3875 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5130 3875 50  0001 C CNN
F 3 "~" H 5200 3875 50  0001 C CNN
	1    5200 3875
	0    1    1    0   
$EndComp
Wire Wire Line
	7225 4275 6725 4275
Wire Wire Line
	4925 3875 5050 3875
$Comp
L Device:R R27
U 1 1 5DE6A917
P 5125 4175
F 0 "R27" V 5200 4175 50  0000 C CNN
F 1 "10k" V 5125 4175 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5055 4175 50  0001 C CNN
F 3 "~" H 5125 4175 50  0001 C CNN
	1    5125 4175
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4975 4175 4925 4175
$Comp
L Device:R R28
U 1 1 5DE6EC38
P 4700 4425
F 0 "R28" V 4800 4375 50  0000 L CNN
F 1 "10k" V 4700 4375 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4630 4425 50  0001 C CNN
F 3 "~" H 4700 4425 50  0001 C CNN
	1    4700 4425
	-1   0    0    1   
$EndComp
Wire Wire Line
	5525 4275 4700 4275
Wire Wire Line
	4700 4675 4700 4575
Wire Wire Line
	4700 4275 4600 4275
Connection ~ 4700 4275
$Comp
L Device:C C15
U 1 1 5DE721D8
P 6875 3050
F 0 "C15" H 6990 3096 50  0000 L CNN
F 1 "100nF" H 6990 3005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6913 2900 50  0001 C CNN
F 3 "~" H 6875 3050 50  0001 C CNN
	1    6875 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6875 2825 6875 2900
Wire Wire Line
	6875 3200 6875 3275
Text Notes 7500 7025 0    315  ~ 0
Flash Memory\n
Wire Wire Line
	5350 3875 5525 3875
Text HLabel 4925 3875 0    59   Input ~ 0
CS
Text HLabel 7225 4275 2    59   Input ~ 0
MISO
Text HLabel 7225 4475 2    59   Input ~ 0
GND
Text HLabel 4925 4175 0    59   Input ~ 0
SCK
Text HLabel 4600 4275 0    59   Input ~ 0
MOSI
Text HLabel 4700 4675 0    59   Input ~ 0
3.3V
Text HLabel 6875 3275 2    59   Input ~ 0
GND
Text HLabel 6875 2825 2    59   Input ~ 0
3.3V
$Comp
L Bertha_main-rescue:SST26VF064B-104V_MF-SST26VF064B-104V_MF IC1
U 1 1 5E4209B5
P 6125 4075
F 0 "IC1" H 6125 4742 50  0000 C CNN
F 1 "SST26VF064B-104V_MF" H 6125 4651 50  0000 C CNN
F 2 "Package_SO:SOIJ-8_5.3x5.3mm_P1.27mm" H 6125 4075 50  0001 L BNN
F 3 "Unavailable" H 6125 4075 50  0001 L BNN
F 4 "SST26VF064B-104V/MF" H 6125 4075 50  0001 L BNN "Field4"
F 5 "Memory; SDI, SPI, SQI; TDFN8; 2.3÷3.6V; Memory: Serial Flash; 64Mbit" H 6125 4075 50  0001 L BNN "Field5"
F 6 "WDFN-8 Microchip" H 6125 4075 50  0001 L BNN "Field6"
F 7 "Microchip" H 6125 4075 50  0001 L BNN "Field7"
F 8 "None" H 6125 4075 50  0001 L BNN "Field8"
	1    6125 4075
	1    0    0    -1  
$EndComp
Text HLabel 4925 4025 0    59   Input ~ 0
3.3V
Wire Wire Line
	5275 4175 5525 4175
Wire Wire Line
	6725 4475 7225 4475
Wire Wire Line
	7225 3675 6725 3675
Text HLabel 7225 3675 2    59   Input ~ 0
3.3V
Wire Wire Line
	4925 4025 5325 4025
Wire Wire Line
	5325 4025 5325 3975
Wire Wire Line
	5325 3975 5525 3975
Wire Wire Line
	5325 4025 5325 4075
Wire Wire Line
	5325 4075 5525 4075
Connection ~ 5325 4025
Text Notes 5475 3875 0    50   ~ 0
CS
Text Notes 6675 4275 0    50   ~ 0
MISO
Text Notes 5475 3975 0    50   ~ 0
WP
Text Notes 6675 4475 0    50   ~ 0
GND
Text Notes 6675 3675 0    50   ~ 0
VCC
Text Notes 5400 4075 0    50   ~ 0
HOLD
Text Notes 5450 4175 0    50   ~ 0
SCK
Text Notes 5400 4275 0    50   ~ 0
MOSI
$EndSCHEMATC
