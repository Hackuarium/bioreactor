EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Bertha_main-eagle-import:JUMPER-PAD-2-NC_BY_TRACE SJ?
U 1 1 5E3C27B4
P 3550 4875
F 0 "SJ?" H 3650 5000 59  0000 R CNN
F 1 "JUMPER-PAD-2-NC_BY_TRACE" H 4375 5125 59  0000 R CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 3550 4875 50  0001 C CNN
F 3 "" H 3550 4875 50  0001 C CNN
	1    3550 4875
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5E3C27BA
P 3800 4875
F 0 "C?" H 3925 4925 50  0000 L CNN
F 1 "100nF" H 3825 4775 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3838 4725 50  0001 C CNN
F 3 "~" H 3800 4875 50  0001 C CNN
	1    3800 4875
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E3C27C0
P 4125 4875
F 0 "C?" H 4250 4925 50  0000 L CNN
F 1 "10uF" H 4150 4775 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4163 4725 50  0001 C CNN
F 3 "~" H 4125 4875 50  0001 C CNN
	1    4125 4875
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 4725 3950 4725
Wire Wire Line
	3950 4625 3950 4725
Connection ~ 3950 4725
Wire Wire Line
	3950 4725 4125 4725
Wire Wire Line
	3800 5025 3975 5025
Wire Wire Line
	3975 5175 3975 5025
Connection ~ 3975 5025
Wire Wire Line
	3975 5025 4125 5025
Wire Wire Line
	3550 5175 3550 5075
Wire Wire Line
	3550 4600 3550 4675
Text Notes 3050 3375 0    55   ~ 0
Red\nBlack\nWhite\nYellow
$Comp
L Device:C C?
U 1 1 5E3C27FC
P 5875 3700
F 0 "C?" V 6025 3600 50  0000 L CNN
F 1 "100nF" V 5750 3575 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5913 3550 50  0001 C CNN
F 3 "~" H 5875 3700 50  0001 C CNN
	1    5875 3700
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5E3C280F
P 4825 3400
F 0 "C?" H 4875 3475 50  0000 L CNN
F 1 "100nF" H 4850 3300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4863 3250 50  0001 C CNN
F 3 "~" H 4825 3400 50  0001 C CNN
	1    4825 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E3C2815
P 5150 3400
F 0 "C?" H 5200 3475 50  0000 L CNN
F 1 "10uF" H 5175 3300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5188 3250 50  0001 C CNN
F 3 "~" H 5150 3400 50  0001 C CNN
	1    5150 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6025 3700 6125 3700
Wire Wire Line
	5500 3050 5150 3050
Wire Wire Line
	4825 3050 4825 3250
Wire Wire Line
	5150 3050 5150 3250
Connection ~ 5150 3050
Wire Wire Line
	5150 3050 4825 3050
Wire Wire Line
	5150 3550 5150 3700
Wire Wire Line
	4825 3550 4825 3700
Wire Wire Line
	4825 3700 5000 3700
Connection ~ 5150 3700
Connection ~ 5500 3050
Wire Wire Line
	5500 3050 5900 3050
Wire Wire Line
	5900 3050 5900 3200
Connection ~ 5000 3700
Wire Wire Line
	5000 3700 5150 3700
Text Notes 7500 5125 2    55   ~ 0
Default: Closed - Data rate set to 10SPS\n\nOpen jumper to set to 80SPS\nIncreases noise per read
Text Notes 4775 4950 0    55   ~ 0
VCC: 2.7 - 5.5V\nIO: 2.7 - 5.5V\n
$Comp
L Bertha_main-eagle-import:SJ J?
U 1 1 5E3C285D
P 7675 3000
F 0 "J?" H 7675 2900 59  0000 C CNN
F 1 "SJ" H 7675 3100 59  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 7675 3000 50  0001 C CNN
F 3 "" H 7675 3000 50  0001 C CNN
	1    7675 3000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5E3C2866
P 7375 2850
F 0 "R?" V 7475 2750 50  0000 L CNN
F 1 "10k" V 7375 2775 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7305 2850 50  0001 C CNN
F 3 "~" H 7375 2850 50  0001 C CNN
	1    7375 2850
	1    0    0    -1  
$EndComp
Connection ~ 7375 3000
Wire Wire Line
	7375 3000 7575 3000
Wire Wire Line
	7775 3000 7825 3000
Wire Wire Line
	7375 2625 7375 2700
Text HLabel 7325 3200 2    59   Input ~ 0
GND
Text HLabel 7825 3000 2    59   Input ~ 0
GND
Text HLabel 3975 5175 2    59   Input ~ 0
GND
Text HLabel 3550 5175 2    59   Input ~ 0
GND
Text HLabel 6125 2650 1    59   Input ~ 0
3.3V
Text HLabel 7225 2650 1    59   Input ~ 0
3.3V
Text HLabel 7375 2625 2    59   Input ~ 0
3.3V
Text HLabel 3950 4625 2    59   Input ~ 0
3.3V
Text Label 5000 3825 2    59   ~ 0
LGND
Wire Wire Line
	5000 3700 5000 3825
Text Label 3550 4600 0    59   ~ 0
LGND
Text Notes 7100 7000 0    315  ~ 0
Load Cell 24bits
Text HLabel 7650 4000 2    50   Input ~ 0
B+
Text HLabel 7650 4200 2    50   Input ~ 0
B-
Text HLabel 5500 2650 1    59   Input ~ 0
3.3V
Wire Wire Line
	5500 2650 5500 3050
Wire Wire Line
	5150 3700 5500 3700
Wire Wire Line
	5500 3400 5500 3700
Connection ~ 5500 3700
Wire Wire Line
	5500 3700 5650 3700
Wire Wire Line
	5650 3600 5650 3700
Connection ~ 5650 3700
Wire Wire Line
	5650 3700 5725 3700
Wire Wire Line
	7225 4200 7650 4200
Wire Wire Line
	6125 3700 6125 3800
Wire Wire Line
	5650 3600 6125 3600
Wire Wire Line
	6125 3400 5500 3400
Wire Wire Line
	5900 3200 6125 3200
Wire Wire Line
	7225 2650 7225 2800
Wire Wire Line
	7375 3000 7225 3000
Wire Wire Line
	7325 3200 7225 3200
NoConn ~ 7225 3400
Wire Wire Line
	7225 4000 7650 4000
Wire Wire Line
	6125 2650 6125 2800
$Comp
L Bertha_main-eagle-import:HX711HX711 U?
U 1 1 5E3C27D4
P 6725 3500
F 0 "U?" H 6675 4486 59  0000 C CNN
F 1 "HX711HX711" H 6675 4381 59  0000 C CNN
F 2 "Package_SO:STC_SOP-16_3.9x9.9mm_P1.27mm" H 6725 3500 50  0001 C CNN
F 3 "" H 6725 3500 50  0001 C CNN
	1    6725 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 4000 6125 4000
Wire Wire Line
	6050 4200 6125 4200
Text Label 6050 4000 2    50   ~ 0
LGND
Text HLabel 6050 4200 0    50   Input ~ 0
A+
Text GLabel 7400 3800 2    50   Input ~ 0
A5
Text GLabel 7400 3600 2    50   Input ~ 0
D7
Wire Wire Line
	7225 3600 7400 3600
Wire Wire Line
	7225 3800 7400 3800
$EndSCHEMATC
