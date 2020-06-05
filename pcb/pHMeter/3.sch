EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
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
L ACT4088:ACT4088 U?
U 1 1 5E004CC9
P 4325 4000
F 0 "U?" H 4325 4715 50  0000 C CNN
F 1 "ACT4088" H 4325 4624 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6_Handsoldering" H 4375 4000 50  0001 C CNN
F 3 "" H 4375 4000 50  0001 C CNN
	1    4325 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E004CCF
P 4775 3750
F 0 "C?" H 4890 3796 50  0000 L CNN
F 1 "22nF" H 4890 3705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4813 3600 50  0001 C CNN
F 3 "~" H 4775 3750 50  0001 C CNN
	1    4775 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E004CDB
P 5125 4350
F 0 "R?" V 5225 4400 50  0000 C CNN
F 1 "49.9k" V 5025 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5055 4350 50  0001 C CNN
F 3 "~" H 5125 4350 50  0001 C CNN
	1    5125 4350
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E004CE1
P 4775 4600
F 0 "R?" H 4705 4554 50  0000 R CNN
F 1 "16.23k" H 4705 4645 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4705 4600 50  0001 C CNN
F 3 "~" H 4775 4600 50  0001 C CNN
	1    4775 4600
	-1   0    0    1   
$EndComp
Text HLabel 3725 3700 0    50   Input ~ 0
VIN
Wire Wire Line
	3725 3700 3775 3700
Wire Wire Line
	4625 4350 4775 4350
Wire Wire Line
	4775 4450 4775 4350
Connection ~ 4775 4350
Wire Wire Line
	4775 4350 4975 4350
Wire Wire Line
	5275 4350 5375 4350
Wire Wire Line
	5375 4350 5375 3950
Wire Wire Line
	5375 3950 5275 3950
Wire Wire Line
	4975 3950 4775 3950
Wire Wire Line
	4775 3900 4775 3950
Connection ~ 4775 3950
Wire Wire Line
	4775 3950 4625 3950
Wire Wire Line
	4625 3550 4775 3550
Wire Wire Line
	4775 3550 4775 3600
Wire Wire Line
	5375 3950 5575 3950
Wire Wire Line
	5575 3950 5575 4000
Connection ~ 5375 3950
Text HLabel 6175 3950 2    50   Output ~ 0
3.3V
Connection ~ 5575 3950
$Comp
L Device:C C?
U 1 1 5E004D0F
P 3775 3900
F 0 "C?" H 3890 3946 50  0000 L CNN
F 1 "10µF" H 3890 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3813 3750 50  0001 C CNN
F 3 "~" H 3775 3900 50  0001 C CNN
	1    3775 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3775 3750 3775 3700
Text Notes 4925 4900 0    50   ~ 0
3.3v: 16.23k\n5v: 9.64k
Wire Wire Line
	5575 3950 6175 3950
$Comp
L Device:D D?
U 1 1 5E004D28
P 4775 4100
F 0 "D?" V 4729 4179 50  0000 L CNN
F 1 "B240A" V 4820 4179 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 4775 4100 50  0001 C CNN
F 3 "~" H 4775 4100 50  0001 C CNN
	1    4775 4100
	0    1    1    0   
$EndComp
NoConn ~ 4025 4150
Text Notes 6700 3425 0    118  ~ 0
Power LEDS
$Comp
L Device:R R?
U 1 1 5E1D0FCF
P 8325 3625
AR Path="/5E0D7B92/5E1D0FCF" Ref="R?"  Part="1" 
AR Path="/5E0D7D04/5E1D0FCF" Ref="R?"  Part="1" 
AR Path="/5E1D0FCF" Ref="R?"  Part="1" 
AR Path="/5E0005EE/5E1D0FCF" Ref="R22"  Part="1" 
AR Path="/5ED0DFF6/5E1D0FCF" Ref="R?"  Part="1" 
F 0 "R?" V 8250 3625 50  0000 C CNN
F 1 "10k" V 8325 3625 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8255 3625 50  0001 C CNN
F 3 "~" H 8325 3625 50  0001 C CNN
	1    8325 3625
	0    1    1    0   
$EndComp
Wire Wire Line
	6950 3625 7275 3625
Wire Wire Line
	8550 3625 8475 3625
$Comp
L Device:R R?
U 1 1 5E1D0FDF
P 8325 4225
AR Path="/5E0D7B92/5E1D0FDF" Ref="R?"  Part="1" 
AR Path="/5E0D7D04/5E1D0FDF" Ref="R?"  Part="1" 
AR Path="/5E1D0FDF" Ref="R?"  Part="1" 
AR Path="/5E0005EE/5E1D0FDF" Ref="R23"  Part="1" 
AR Path="/5ED0DFF6/5E1D0FDF" Ref="R?"  Part="1" 
F 0 "R?" V 8250 4225 50  0000 C CNN
F 1 "1k" V 8325 4225 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8255 4225 50  0001 C CNN
F 3 "~" H 8325 4225 50  0001 C CNN
	1    8325 4225
	0    1    1    0   
$EndComp
Wire Wire Line
	6950 4225 7275 4225
Wire Wire Line
	8550 4225 8475 4225
Text Notes 7700 4325 0    59   ~ 0
LDPW3\n
Wire Wire Line
	7575 4225 8175 4225
Text Notes 7675 3725 0    59   ~ 0
LDPW12\n
Wire Wire Line
	7575 3625 8175 3625
Text Label 5575 4400 0    50   ~ 0
GND
$Comp
L Device:C C?
U 1 1 5E004CFD
P 5575 4150
F 0 "C?" H 5690 4196 50  0000 L CNN
F 1 "22µF" H 5690 4105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5613 4000 50  0001 C CNN
F 3 "~" H 5575 4150 50  0001 C CNN
	1    5575 4150
	1    0    0    -1  
$EndComp
Text HLabel 3475 5000 0    79   Input ~ 0
GND
Wire Wire Line
	3775 5000 3475 5000
Wire Wire Line
	3775 4050 3775 5000
Wire Wire Line
	3775 5000 4325 5000
Wire Wire Line
	4325 4550 4325 5000
Connection ~ 3775 5000
Wire Wire Line
	4325 5000 4775 5000
Wire Wire Line
	4775 4750 4775 5000
Connection ~ 4325 5000
Text HLabel 4775 4250 0    51   Input ~ 0
GND
Text HLabel 6925 3900 0    79   Input ~ 0
GND
Wire Wire Line
	6950 3625 6950 3900
Wire Wire Line
	6950 3900 6925 3900
Wire Wire Line
	6950 3900 6950 4225
Connection ~ 6950 3900
Text HLabel 8550 3625 2    51   Input ~ 0
VIN
Text HLabel 8550 4225 2    51   Input ~ 0
3.3V
Text HLabel 5575 4500 2    51   Input ~ 0
GND
Wire Wire Line
	5575 4300 5575 4500
Wire Wire Line
	4025 3700 3775 3700
Connection ~ 3775 3700
$Comp
L Device:LED D?
U 1 1 5E883301
P 7425 3625
F 0 "D?" H 7425 3550 50  0000 C CNN
F 1 "RED" H 7425 3725 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7425 3625 50  0001 C CNN
F 3 "~" H 7425 3625 50  0001 C CNN
	1    7425 3625
	1    0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 5E886D2D
P 7425 4225
F 0 "D?" H 7425 4150 50  0000 C CNN
F 1 "RED" H 7425 4325 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7425 4225 50  0001 C CNN
F 3 "~" H 7425 4225 50  0001 C CNN
	1    7425 4225
	1    0    0    1   
$EndComp
Text Notes 7875 7050 0    315  ~ 0
3.3V LDO
$Comp
L Device:L L?
U 1 1 5E004CD5
P 5125 3950
F 0 "L?" V 5200 3950 50  0000 C CNN
F 1 "4.7µH" V 5075 3950 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5125 3950 50  0001 C CNN
F 3 "~" H 5125 3950 50  0001 C CNN
	1    5125 3950
	0    -1   -1   0   
$EndComp
NoConn ~ 2525 2150
$Comp
L Device:C C?
U 1 1 5EDC3622
P 3650 6000
F 0 "C?" H 3765 6046 50  0000 L CNN
F 1 "10u" H 3765 5955 50  0000 L CNN
F 2 "" H 3688 5850 50  0001 C CNN
F 3 "~" H 3650 6000 50  0001 C CNN
	1    3650 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 6000 3900 6000
Wire Wire Line
	3900 6000 3900 5800
Wire Wire Line
	3900 5800 3950 5800
Wire Wire Line
	3900 5800 3650 5800
Wire Wire Line
	3650 5800 3650 5850
Connection ~ 3900 5800
Wire Wire Line
	3650 5800 3600 5800
Connection ~ 3650 5800
Wire Wire Line
	3650 6225 3650 6150
Wire Wire Line
	4350 6200 4350 6275
Text HLabel 3600 5800 0    50   Input ~ 0
VIN
Text HLabel 3650 6225 0    50   Input ~ 0
GND
Text HLabel 4350 6275 0    50   Input ~ 0
GND
$Comp
L Device:C C?
U 1 1 5EDCC8A2
P 4975 5900
F 0 "C?" V 4723 5900 50  0000 C CNN
F 1 "100n" V 4814 5900 50  0000 C CNN
F 2 "" H 5013 5750 50  0001 C CNN
F 3 "~" H 4975 5900 50  0001 C CNN
	1    4975 5900
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 5900 4825 5900
Wire Wire Line
	5125 5900 5200 5900
Wire Wire Line
	5200 5900 5200 5800
Wire Wire Line
	5200 5800 4750 5800
$Comp
L Device:L L?
U 1 1 5EDCF040
P 5400 5800
F 0 "L?" V 5590 5800 50  0000 C CNN
F 1 "3.9u" V 5499 5800 50  0000 C CNN
F 2 "" H 5400 5800 50  0001 C CNN
F 3 "~" H 5400 5800 50  0001 C CNN
	1    5400 5800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5250 5800 5200 5800
Connection ~ 5200 5800
Wire Wire Line
	5550 5800 5600 5800
Wire Wire Line
	5600 5800 5600 6000
Wire Wire Line
	5600 6000 4750 6000
$Comp
L Device:C C?
U 1 1 5EDD102F
P 5725 6000
F 0 "C?" H 5610 5954 50  0000 R CNN
F 1 "22u" H 5610 6045 50  0000 R CNN
F 2 "" H 5763 5850 50  0001 C CNN
F 3 "~" H 5725 6000 50  0001 C CNN
	1    5725 6000
	-1   0    0    1   
$EndComp
Wire Wire Line
	5725 5850 5725 5800
Wire Wire Line
	5725 5800 5600 5800
Connection ~ 5600 5800
Wire Wire Line
	5725 6150 5725 6225
Text HLabel 5725 6225 0    50   Input ~ 0
GND
Text HLabel 6200 5800 2    50   Output ~ 0
3.3V
Wire Wire Line
	6200 5800 6075 5800
Connection ~ 5725 5800
$Comp
L Device:C C?
U 1 1 5EDE0CF8
P 6075 6000
F 0 "C?" H 5960 5954 50  0000 R CNN
F 1 "22u" H 5960 6045 50  0000 R CNN
F 2 "" H 6113 5850 50  0001 C CNN
F 3 "~" H 6075 6000 50  0001 C CNN
	1    6075 6000
	-1   0    0    1   
$EndComp
Wire Wire Line
	6075 5850 6075 5800
Connection ~ 6075 5800
Wire Wire Line
	6075 5800 5725 5800
Text HLabel 6075 6225 0    50   Input ~ 0
GND
Wire Wire Line
	6075 6150 6075 6225
Text Notes 3425 6575 0    50   ~ 0
The inductor’s DC resistance should be less than 100mΩ.\n \nThe  input  capacitor,  electrolytic,  or  ceramics  with  low  ESR  should  be  used.
$Comp
L bioreactor:AP63203WU-7 U?
U 1 1 5EDBF789
P 4350 5900
F 0 "U?" H 4350 6267 50  0000 C CNN
F 1 "AP63203WU-7" H 4350 6176 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-6" H 4350 5000 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP65111A.pdf" H 4350 5900 50  0001 C CNN
	1    4350 5900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
