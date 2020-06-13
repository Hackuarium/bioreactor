EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
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
L Bertha_main-eagle-import:M05PTH JP5
U 1 1 5E3C27A8
P 3750 3250
F 0 "JP5" H 3858 3736 59  0000 C CNN
F 1 "M05PTH" H 3858 3631 59  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 3750 3250 50  0001 C CNN
F 3 "" H 3750 3250 50  0001 C CNN
	1    3750 3250
	1    0    0    -1  
$EndComp
$Comp
L Bertha_main-eagle-import:M02PTH JP6
U 1 1 5E3C27AE
P 3750 4075
F 0 "JP6" H 3858 4461 59  0000 C CNN
F 1 "M02PTH" H 3858 4356 59  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3750 4075 50  0001 C CNN
F 3 "" H 3750 4075 50  0001 C CNN
	1    3750 4075
	1    0    0    -1  
$EndComp
$Comp
L Bertha_main-eagle-import:JUMPER-PAD-2-NC_BY_TRACE SJ1
U 1 1 5E3C27B4
P 3550 4875
F 0 "SJ1" H 3650 5000 59  0000 R CNN
F 1 "JUMPER-PAD-2-NC_BY_TRACE" H 4375 5125 59  0000 R CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 3550 4875 50  0001 C CNN
F 3 "" H 3550 4875 50  0001 C CNN
	1    3550 4875
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C20
U 1 1 5E3C27BA
P 3800 4875
F 0 "C20" H 3925 4925 50  0000 L CNN
F 1 "100nF" H 3825 4775 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3838 4725 50  0001 C CNN
F 3 "~" H 3800 4875 50  0001 C CNN
	1    3800 4875
	1    0    0    -1  
$EndComp
$Comp
L Device:C C21
U 1 1 5E3C27C0
P 4125 4875
F 0 "C21" H 4250 4925 50  0000 L CNN
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
$Comp
L Bertha_main-eagle-import:HX711HX711 U4
U 1 1 5E3C27D4
P 6725 3500
F 0 "U4" H 6675 4486 59  0000 C CNN
F 1 "HX711" H 6675 4381 59  0000 C CNN
F 2 "Package_SO:STC_SOP-16_3.9x9.9mm_P1.27mm" H 6725 3500 50  0001 C CNN
F 3 "" H 6725 3500 50  0001 C CNN
	1    6725 3500
	1    0    0    -1  
$EndComp
Text Notes 3375 3475 0    55   ~ 0
E+\nE-\nA-\nA+\nShield
Text Notes 3050 3375 0    55   ~ 0
Red\nBlack\nWhite\nYellow
Wire Wire Line
	4125 3450 4050 3450
$Comp
L Device:R R33
U 1 1 5E3C27DF
P 5550 4250
F 0 "R33" V 5475 4250 50  0000 C CNN
F 1 "100" V 5550 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5480 4250 50  0001 C CNN
F 3 "~" H 5550 4250 50  0001 C CNN
	1    5550 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R32
U 1 1 5E3C27E5
P 5550 3950
F 0 "R32" V 5475 3950 50  0000 C CNN
F 1 "100" V 5550 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5480 3950 50  0001 C CNN
F 3 "~" H 5550 3950 50  0001 C CNN
	1    5550 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	5825 4250 6125 4250
Wire Wire Line
	6125 4250 6125 4200
Wire Wire Line
	5825 3950 6125 3950
Wire Wire Line
	6125 3950 6125 4000
Wire Wire Line
	5700 3950 5825 3950
Connection ~ 5825 3950
Wire Wire Line
	5700 4250 5825 4250
Connection ~ 5825 4250
Wire Wire Line
	4050 3150 4125 3150
$Comp
L Bertha_main-eagle-import:TRANSISTOR_PNPMMBT4403 Q4
U 1 1 5E3C27F4
P 5600 2750
F 0 "Q4" H 5743 2803 59  0000 L CNN
F 1 "TRANSISTOR_PNPMMBT4403" H 5743 2698 59  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5600 2750 50  0001 C CNN
F 3 "" H 5600 2750 50  0001 C CNN
	1    5600 2750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6125 2650 6125 2800
$Comp
L Device:C C18
U 1 1 5E3C27FC
P 5925 3700
F 0 "C18" V 6075 3600 50  0000 L CNN
F 1 "100nF" V 5800 3575 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5963 3550 50  0001 C CNN
F 3 "~" H 5925 3700 50  0001 C CNN
	1    5925 3700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6125 3700 6125 3800
Wire Wire Line
	4050 3250 4675 3250
Wire Wire Line
	4675 3250 4675 3950
Wire Wire Line
	4675 3950 5400 3950
Wire Wire Line
	4050 3350 4575 3350
Wire Wire Line
	4575 3350 4575 4250
Wire Wire Line
	4575 4250 5400 4250
$Comp
L Device:C C19
U 1 1 5E3C2809
P 5825 4100
F 0 "C19" H 5875 4175 50  0000 L CNN
F 1 "100nF" H 5850 4000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5863 3950 50  0001 C CNN
F 3 "~" H 5825 4100 50  0001 C CNN
	1    5825 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C16
U 1 1 5E3C280F
P 4825 3250
F 0 "C16" H 4875 3325 50  0000 L CNN
F 1 "100nF" H 4850 3150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4863 3100 50  0001 C CNN
F 3 "~" H 4825 3250 50  0001 C CNN
	1    4825 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C17
U 1 1 5E3C2815
P 5150 3250
F 0 "C17" H 5200 3325 50  0000 L CNN
F 1 "10uF" H 5175 3150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5188 3100 50  0001 C CNN
F 3 "~" H 5150 3250 50  0001 C CNN
	1    5150 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6075 3700 6125 3700
Wire Wire Line
	6125 3600 5775 3600
Wire Wire Line
	5775 3600 5775 3700
Connection ~ 5775 3700
$Comp
L Device:R R31
U 1 1 5E3C281F
P 5500 3550
F 0 "R31" V 5600 3450 50  0000 L CNN
F 1 "8.2k" V 5500 3475 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5430 3550 50  0001 C CNN
F 3 "~" H 5500 3550 50  0001 C CNN
	1    5500 3550
	1    0    0    -1  
$EndComp
Connection ~ 5500 3700
Wire Wire Line
	5500 3700 5775 3700
$Comp
L Device:R R30
U 1 1 5E3C2827
P 5500 3200
F 0 "R30" V 5600 3100 50  0000 L CNN
F 1 "20k" V 5500 3125 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5430 3200 50  0001 C CNN
F 3 "~" H 5500 3200 50  0001 C CNN
	1    5500 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6125 3400 5500 3400
Wire Wire Line
	5500 3350 5500 3400
Connection ~ 5500 3400
Wire Wire Line
	5500 3050 5150 3050
Wire Wire Line
	4825 3050 4825 3100
Connection ~ 4825 3050
Wire Wire Line
	4825 3050 4050 3050
Wire Wire Line
	5150 3050 5150 3100
Connection ~ 5150 3050
Wire Wire Line
	5150 3050 4825 3050
Wire Wire Line
	5150 3400 5150 3700
Wire Wire Line
	5150 3700 5500 3700
Wire Wire Line
	4825 3400 4825 3700
Wire Wire Line
	4825 3700 5000 3700
Connection ~ 5150 3700
Wire Wire Line
	5500 2950 5500 3050
Connection ~ 5500 3050
Wire Wire Line
	5500 3050 5900 3050
Wire Wire Line
	5900 3050 5900 3200
Wire Wire Line
	5900 3200 6125 3200
Wire Wire Line
	6000 2750 6000 3000
Wire Wire Line
	6000 3000 6125 3000
Wire Wire Line
	5700 2750 6000 2750
Text Notes 5650 2725 0    47   ~ 0
VBG=1.25V
Wire Wire Line
	5500 2450 5500 2550
Connection ~ 5000 3700
Wire Wire Line
	5000 3700 5150 3700
Wire Wire Line
	4050 3975 4475 3975
Wire Wire Line
	4475 3975 4475 4400
Wire Wire Line
	4475 4400 7350 4400
Wire Wire Line
	7350 4400 7350 4200
Wire Wire Line
	7350 4200 7225 4200
Wire Wire Line
	4050 4075 4375 4075
Wire Wire Line
	4375 4075 4375 4500
Wire Wire Line
	4375 4500 7450 4500
Wire Wire Line
	7450 4500 7450 4000
Wire Wire Line
	7450 4000 7225 4000
Text Notes 7500 5125 2    55   ~ 0
Default: Closed - Data rate set to 10SPS\n\nOpen jumper to set to 80SPS\nIncreases noise per read
Text Notes 4775 4950 0    55   ~ 0
VCC: 2.7 - 5.5V\nIO: 2.7 - 5.5V\n
Wire Wire Line
	7375 3600 7225 3600
Wire Wire Line
	7225 3800 7375 3800
Wire Wire Line
	7225 2650 7225 2800
$Comp
L Bertha_main-eagle-import:SJ J9
U 1 1 5E3C285D
P 7675 3000
F 0 "J9" H 7675 2900 59  0000 C CNN
F 1 "SJ" H 7675 3100 59  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 7675 3000 50  0001 C CNN
F 3 "" H 7675 3000 50  0001 C CNN
	1    7675 3000
	-1   0    0    1   
$EndComp
Wire Wire Line
	7325 3200 7225 3200
$Comp
L Device:R R29
U 1 1 5E3C2866
P 7375 2850
F 0 "R29" V 7475 2750 50  0000 L CNN
F 1 "10k" V 7375 2775 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7305 2850 50  0001 C CNN
F 3 "~" H 7375 2850 50  0001 C CNN
	1    7375 2850
	1    0    0    -1  
$EndComp
Connection ~ 7375 3000
Wire Wire Line
	7375 3000 7225 3000
Wire Wire Line
	7375 3000 7575 3000
Wire Wire Line
	7775 3000 7825 3000
Wire Wire Line
	7375 2625 7375 2700
Text HLabel 4125 3450 2    59   Input ~ 0
GND
Text HLabel 4125 3150 2    59   Input ~ 0
GND
Text HLabel 7325 3200 2    59   Input ~ 0
GND
Text HLabel 7825 3000 2    59   Input ~ 0
GND
Text HLabel 3975 5175 2    59   Input ~ 0
GND
Text HLabel 3550 5175 2    59   Input ~ 0
GND
Text HLabel 7375 3600 2    59   Input ~ 0
DATA
Text HLabel 7375 3800 2    59   Input ~ 0
CLK
Text HLabel 5500 2450 2    59   Input ~ 0
3.3V
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
NoConn ~ 7225 3400
Text Notes 7100 7000 0    315  ~ 0
Load Cell 24bits
$EndSCHEMATC
