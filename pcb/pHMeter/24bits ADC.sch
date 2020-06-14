EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 6
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
L Bertha_main-eagle-import:JUMPER-PAD-2-NC_BY_TRACE SJ1
U 1 1 5E3C27B4
P 3550 4900
F 0 "SJ1" H 3650 5025 59  0000 R CNN
F 1 "JUMPER-PAD-2-NC_BY_TRACE" H 4375 5150 59  0000 R CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3550 4900 50  0001 C CNN
F 3 "" H 3550 4900 50  0001 C CNN
	1    3550 4900
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C26
U 1 1 5E3C27BA
P 3800 4875
F 0 "C26" H 3925 4925 50  0000 L CNN
F 1 "100nF" H 3825 4775 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3838 4725 50  0001 C CNN
F 3 "~" H 3800 4875 50  0001 C CNN
	1    3800 4875
	1    0    0    -1  
$EndComp
$Comp
L Device:C C27
U 1 1 5E3C27C0
P 4125 4875
F 0 "C27" H 4250 4925 50  0000 L CNN
F 1 "10uF" H 4150 4775 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4163 4725 50  0001 C CNN
F 3 "~" H 4125 4875 50  0001 C CNN
	1    4125 4875
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4550 3950 4675
Wire Wire Line
	3550 5175 3550 5100
Wire Wire Line
	3550 4600 3550 4700
$Comp
L Device:C C28
U 1 1 5E3C280F
P 4825 3450
F 0 "C28" H 4875 3525 50  0000 L CNN
F 1 "100nF" H 4850 3350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4863 3300 50  0001 C CNN
F 3 "~" H 4825 3450 50  0001 C CNN
	1    4825 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C29
U 1 1 5E3C2815
P 5150 3450
F 0 "C29" H 5200 3525 50  0000 L CNN
F 1 "10uF" H 5175 3350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5188 3300 50  0001 C CNN
F 3 "~" H 5150 3450 50  0001 C CNN
	1    5150 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4825 3200 4825 3300
Connection ~ 4825 3200
Wire Wire Line
	5150 3600 5150 3700
Wire Wire Line
	4825 3600 4825 3700
Connection ~ 5150 3700
Wire Wire Line
	4825 3200 5150 3200
Connection ~ 4825 3700
Wire Wire Line
	4825 3700 5150 3700
Text Notes 7500 5125 2    55   ~ 0
Default: Closed - Data rate set to 10SPS\n\nOpen jumper to set to 80SPS\nIncreases noise per read
Text Notes 4775 4950 0    55   ~ 0
VCC: 2.7 - 5.5V\nIO: 2.7 - 5.5V\n
$Comp
L Bertha_main-eagle-import:SJ J8
U 1 1 5E3C285D
P 7825 3000
F 0 "J8" H 7825 2900 59  0000 C CNN
F 1 "SJ" H 7825 3100 59  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 7825 3000 50  0001 C CNN
F 3 "" H 7825 3000 50  0001 C CNN
	1    7825 3000
	-1   0    0    1   
$EndComp
Wire Wire Line
	7925 3000 8025 3000
Text HLabel 7475 3200 2    59   Input ~ 0
GND
Text HLabel 8025 3000 2    59   Input ~ 0
GND
Text HLabel 3550 5175 3    59   Input ~ 0
GND
Text HLabel 5950 2650 1    59   Input ~ 0
3.3V
Text HLabel 7425 2650 1    59   Input ~ 0
3.3V
Text HLabel 7575 2575 1    59   Input ~ 0
3.3V
Text HLabel 3950 4550 1    59   Input ~ 0
3.3V
Text Label 4825 3825 2    59   ~ 0
LGND
Wire Wire Line
	4825 3700 4825 3825
Text Label 3550 4600 0    59   ~ 0
LGND
Text Notes 7100 7000 0    315  ~ 0
24bits HX711
Text HLabel 7475 4000 2    50   Input ~ 0
B+
Text HLabel 7475 4200 2    50   Input ~ 0
B-
Text HLabel 4825 3100 1    59   Input ~ 0
3.3V
Wire Wire Line
	4825 3100 4825 3200
Wire Wire Line
	5150 3700 5500 3700
Wire Wire Line
	5500 3400 5500 3700
Connection ~ 5600 3700
Wire Wire Line
	7475 3200 7325 3200
NoConn ~ 7325 3400
Wire Wire Line
	5925 4200 6025 4200
Text HLabel 5925 4200 0    50   Input ~ 0
A+
$Comp
L Device:R R41
U 1 1 5E3C2866
P 7575 2800
F 0 "R41" V 7675 2700 50  0000 L CNN
F 1 "10k" V 7575 2725 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7505 2800 50  0001 C CNN
F 3 "~" H 7575 2800 50  0001 C CNN
	1    7575 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7725 3000 7575 3000
Wire Wire Line
	7575 2650 7575 2575
Wire Wire Line
	7575 2950 7575 3000
Connection ~ 7575 3000
Wire Wire Line
	7575 3000 7325 3000
Wire Wire Line
	5150 3300 5150 3200
Connection ~ 5150 3200
Wire Wire Line
	3800 5025 3800 5100
Wire Wire Line
	4125 5025 4125 5100
Wire Wire Line
	3800 5100 3975 5100
Connection ~ 3975 5100
Wire Wire Line
	4125 5100 3975 5100
Wire Wire Line
	3975 5175 3975 5100
Text HLabel 3975 5175 3    59   Input ~ 0
GND
Wire Wire Line
	4125 4725 4125 4675
Wire Wire Line
	4125 4675 3950 4675
Connection ~ 3950 4675
Wire Wire Line
	3800 4725 3800 4675
Wire Wire Line
	3800 4675 3950 4675
Text HLabel 7475 3800 2    50   Input ~ 0
PD_SCK
Text HLabel 7475 3600 2    50   Input ~ 0
DOUT
NoConn ~ 6025 3000
Wire Wire Line
	5600 3800 5650 3800
$Comp
L Device:C C30
U 1 1 5E3C27FC
P 5800 3800
F 0 "C30" V 5950 3700 50  0000 L CNN
F 1 "100nF" V 5675 3675 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5838 3650 50  0001 C CNN
F 3 "~" H 5800 3800 50  0001 C CNN
	1    5800 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5600 3700 5600 3800
Connection ~ 5500 3700
Wire Wire Line
	5500 3700 5600 3700
Wire Wire Line
	5600 3600 5600 3700
Text Label 5650 4000 2    50   ~ 0
LGND
Wire Wire Line
	5650 4000 6025 4000
Wire Wire Line
	5500 3400 6025 3400
Wire Wire Line
	5600 3600 6025 3600
$Comp
L bioreactor:HX711 U6
U 1 1 5EDF981C
P 6725 3500
F 0 "U6" H 6675 4486 59  0000 C CNN
F 1 "HX711" H 6675 4381 59  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 6725 2450 50  0001 C CNN
F 3 "https://components101.com/sites/default/files/component_datasheet/HX711%20Datasheet.pdf" H 6725 3500 50  0001 C CNN
	1    6725 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6025 2800 5950 2800
Wire Wire Line
	5950 2800 5950 2650
Wire Wire Line
	5950 3800 6025 3800
Wire Wire Line
	5150 3200 6025 3200
Wire Wire Line
	7425 2650 7425 2800
Wire Wire Line
	7425 2800 7325 2800
Wire Wire Line
	7325 3600 7475 3600
Wire Wire Line
	7325 3800 7475 3800
Wire Wire Line
	7325 4000 7475 4000
Wire Wire Line
	7325 4200 7475 4200
$EndSCHEMATC
