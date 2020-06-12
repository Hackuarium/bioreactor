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
Text Notes 6700 3425 0    118  ~ 0
Power LEDS
$Comp
L Device:R R?
U 1 1 5E1D0FCF
P 6850 3775
AR Path="/5E0D7B92/5E1D0FCF" Ref="R?"  Part="1" 
AR Path="/5E0D7D04/5E1D0FCF" Ref="R?"  Part="1" 
AR Path="/5E1D0FCF" Ref="R?"  Part="1" 
AR Path="/5E0005EE/5E1D0FCF" Ref="R?"  Part="1" 
AR Path="/5ED0DFF6/5E1D0FCF" Ref="R39"  Part="1" 
F 0 "R39" V 6775 3775 50  0000 C CNN
F 1 "10k" V 6850 3775 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6780 3775 50  0001 C CNN
F 3 "~" H 6850 3775 50  0001 C CNN
	1    6850 3775
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 4425 6850 4325
Wire Wire Line
	6850 3550 6850 3625
$Comp
L Device:R R?
U 1 1 5E1D0FDF
P 7450 3775
AR Path="/5E0D7B92/5E1D0FDF" Ref="R?"  Part="1" 
AR Path="/5E0D7D04/5E1D0FDF" Ref="R?"  Part="1" 
AR Path="/5E1D0FDF" Ref="R?"  Part="1" 
AR Path="/5E0005EE/5E1D0FDF" Ref="R?"  Part="1" 
AR Path="/5ED0DFF6/5E1D0FDF" Ref="R40"  Part="1" 
F 0 "R40" V 7375 3775 50  0000 C CNN
F 1 "1k" V 7450 3775 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7380 3775 50  0001 C CNN
F 3 "~" H 7450 3775 50  0001 C CNN
	1    7450 3775
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 4425 7450 4325
Wire Wire Line
	7450 3550 7450 3625
Wire Wire Line
	7450 4025 7450 3925
Wire Wire Line
	6850 4025 6850 3925
Text HLabel 7125 4525 0    50   Input ~ 0
GND
Wire Wire Line
	6850 4425 7125 4425
Wire Wire Line
	7125 4425 7125 4525
Wire Wire Line
	7125 4425 7450 4425
Connection ~ 7125 4425
Text HLabel 6850 3550 0    50   Input ~ 0
VIN
Text HLabel 7450 3550 0    50   Input ~ 0
3.3V
$Comp
L Device:LED D15
U 1 1 5E883301
P 6850 4175
F 0 "D15" H 6850 4100 50  0000 C CNN
F 1 "RED" H 6850 4275 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 4175 50  0001 C CNN
F 3 "~" H 6850 4175 50  0001 C CNN
	1    6850 4175
	0    1    -1   0   
$EndComp
$Comp
L Device:LED D16
U 1 1 5E886D2D
P 7450 4175
F 0 "D16" H 7450 4100 50  0000 C CNN
F 1 "RED" H 7450 4275 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7450 4175 50  0001 C CNN
F 3 "~" H 7450 4175 50  0001 C CNN
	1    7450 4175
	0    1    -1   0   
$EndComp
Text Notes 7875 7050 0    315  ~ 0
3.3V LDO
NoConn ~ 2525 2150
$Comp
L Device:C C19
U 1 1 5EDC3622
P 3350 3950
F 0 "C19" H 3465 3996 50  0000 L CNN
F 1 "10u" H 3465 3905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3388 3800 50  0001 C CNN
F 3 "~" H 3350 3950 50  0001 C CNN
	1    3350 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3675 3950 3625 3950
Wire Wire Line
	3625 3950 3625 3750
Wire Wire Line
	3625 3750 3675 3750
Wire Wire Line
	3350 3750 3350 3800
Wire Wire Line
	3350 3750 3300 3750
Connection ~ 3350 3750
Wire Wire Line
	3350 4175 3350 4100
Wire Wire Line
	4075 4150 4075 4225
Text HLabel 3300 3750 0    50   Input ~ 0
VIN
Text HLabel 3350 4175 0    50   Input ~ 0
GND
Text HLabel 4075 4225 0    50   Input ~ 0
GND
$Comp
L Device:C C22
U 1 1 5EDCC8A2
P 4700 3850
F 0 "C22" V 4448 3850 50  0000 C CNN
F 1 "100n" V 4539 3850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4738 3700 50  0001 C CNN
F 3 "~" H 4700 3850 50  0001 C CNN
	1    4700 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	4475 3850 4550 3850
Wire Wire Line
	4850 3850 4925 3850
Wire Wire Line
	4925 3850 4925 3750
Wire Wire Line
	4925 3750 4475 3750
$Comp
L Device:L L2
U 1 1 5EDCF040
P 5125 3750
F 0 "L2" V 5315 3750 50  0000 C CNN
F 1 "3.9u" V 5224 3750 50  0000 C CNN
F 2 "Inductor_SMD:L_TDK_SLF6028" H 5125 3750 50  0001 C CNN
F 3 "~" H 5125 3750 50  0001 C CNN
	1    5125 3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4975 3750 4925 3750
Connection ~ 4925 3750
Wire Wire Line
	5275 3750 5325 3750
Wire Wire Line
	5325 3750 5325 3950
Wire Wire Line
	5325 3950 4475 3950
$Comp
L Device:C C24
U 1 1 5EDD102F
P 5450 3950
F 0 "C24" H 5335 3904 50  0000 R CNN
F 1 "22u" H 5335 3995 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5488 3800 50  0001 C CNN
F 3 "~" H 5450 3950 50  0001 C CNN
	1    5450 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	5450 3800 5450 3750
Wire Wire Line
	5450 3750 5325 3750
Connection ~ 5325 3750
Wire Wire Line
	5450 4100 5450 4175
Text HLabel 5450 4175 0    50   Input ~ 0
GND
Text HLabel 5925 3750 2    50   Output ~ 0
3.3V
Wire Wire Line
	5925 3750 5800 3750
Connection ~ 5450 3750
$Comp
L Device:C C25
U 1 1 5EDE0CF8
P 5800 3950
F 0 "C25" H 5685 3904 50  0000 R CNN
F 1 "22u" H 5685 3995 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5838 3800 50  0001 C CNN
F 3 "~" H 5800 3950 50  0001 C CNN
	1    5800 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	5800 3800 5800 3750
Connection ~ 5800 3750
Wire Wire Line
	5800 3750 5450 3750
Text HLabel 5800 4175 0    50   Input ~ 0
GND
Wire Wire Line
	5800 4100 5800 4175
Text Notes 3175 4650 0    50   ~ 0
The inductor’s DC resistance should be less than 100mΩ.\n \nThe  input  capacitor,  electrolytic,  or  ceramics  with  low  ESR\nshould  be  used.
$Comp
L bioreactor:AP63203WU-7 U5
U 1 1 5EDBF789
P 4075 3850
F 0 "U5" H 4075 4217 50  0000 C CNN
F 1 "AP63203WU-7" H 4075 4126 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-6" H 4075 2950 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP65111A.pdf" H 4075 3850 50  0001 C CNN
	1    4075 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3750 3625 3750
Connection ~ 3625 3750
Text Notes 4175 3400 0    100  ~ 0
3.3 V Buck
$EndSCHEMATC
