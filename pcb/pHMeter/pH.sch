EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
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
L Bertha_main-eagle-import:TLV6004PW U?
U 2 1 5F1CF3D6
P 5550 3450
AR Path="/5F1CF3D6" Ref="U?"  Part="2" 
AR Path="/5F15ED5B/5F1CF3D6" Ref="U1"  Part="2" 
F 0 "U1" H 5550 3817 50  0000 C CNN
F 1 "TLV6004PW" H 5550 3726 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 5550 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlv9004.pdf" H 5600 3650 50  0001 C CNN
	2    5550 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F1CF3DC
P 4550 4500
AR Path="/5F1CF3DC" Ref="C?"  Part="1" 
AR Path="/5F15ED5B/5F1CF3DC" Ref="C3"  Part="1" 
F 0 "C3" H 4665 4546 50  0000 L CNN
F 1 "100n" H 4665 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4588 4350 50  0001 C CNN
F 3 "~" H 4550 4500 50  0001 C CNN
	1    4550 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 4450 5150 4450
Wire Wire Line
	5150 4450 5150 4650
Wire Wire Line
	5150 4650 5950 4650
Wire Wire Line
	5950 4650 5950 4350
Wire Wire Line
	5950 4350 5850 4350
Wire Wire Line
	4900 4250 4900 4350
Wire Wire Line
	4900 4250 5100 4250
Wire Wire Line
	4550 4350 4550 4250
Connection ~ 4900 4250
Wire Wire Line
	4550 4250 4900 4250
$Comp
L Device:R R?
U 1 1 5F1CF3EC
P 4900 4000
AR Path="/5F1CF3EC" Ref="R?"  Part="1" 
AR Path="/5F15ED5B/5F1CF3EC" Ref="R3"  Part="1" 
F 0 "R3" H 4830 3954 50  0000 R CNN
F 1 "10k" H 4830 4045 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4830 4000 50  0001 C CNN
F 3 "~" H 4900 4000 50  0001 C CNN
	1    4900 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 4150 4900 4250
Wire Wire Line
	4900 3850 4900 3750
$Comp
L Bertha_main-eagle-import:GND #?
U 1 1 5F1CF3F4
P 4550 4850
AR Path="/5F1CF3F4" Ref="#?"  Part="1" 
AR Path="/5F15ED5B/5F1CF3F4" Ref="#0101"  Part="1" 
F 0 "#0101" H 4600 4900 50  0001 C CNN
F 1 "GND" H 4653 4888 42  0000 L CNN
F 2 "" H 4550 4850 50  0001 C CNN
F 3 "" H 4550 4850 50  0001 C CNN
	1    4550 4850
	1    0    0    -1  
$EndComp
$Comp
L Bertha_main-eagle-import:GND #?
U 1 1 5F1CF3FA
P 4900 4850
AR Path="/5F1CF3FA" Ref="#?"  Part="1" 
AR Path="/5F15ED5B/5F1CF3FA" Ref="#0102"  Part="1" 
F 0 "#0102" H 4950 4900 50  0001 C CNN
F 1 "GND" H 5003 4888 42  0000 L CNN
F 2 "" H 4900 4850 50  0001 C CNN
F 3 "" H 4900 4850 50  0001 C CNN
	1    4900 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 4750 4900 4650
Wire Wire Line
	4550 4750 4550 4650
$Comp
L Connector:Conn_Coaxial_Power J?
U 1 1 5F1CF402
P 6250 4050
AR Path="/5F1CF402" Ref="J?"  Part="1" 
AR Path="/5F15ED5B/5F1CF402" Ref="J3"  Part="1" 
F 0 "J3" V 6033 4000 50  0000 C CNN
F 1 "Conn_Coaxial_Power" V 6124 4000 50  0000 C CNN
F 2 "Connector_Coaxial:BNC_TEConnectivity_1478204_Vertical" H 6250 4000 50  0001 C CNN
F 3 "~" H 6250 4000 50  0001 C CNN
	1    6250 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 3550 5200 3550
Wire Wire Line
	5200 3550 5200 3750
Wire Wire Line
	5200 3750 5950 3750
Wire Wire Line
	5950 3750 5950 3450
Wire Wire Line
	5950 3450 5850 3450
Wire Wire Line
	5250 3350 5100 3350
Wire Wire Line
	5100 3350 5100 4250
Connection ~ 5100 4250
Wire Wire Line
	5100 4250 5250 4250
$Comp
L Bertha_main-eagle-import:TLV6004PW U?
U 3 1 5F1CF411
P 6900 4150
AR Path="/5F1CF411" Ref="U?"  Part="3" 
AR Path="/5F15ED5B/5F1CF411" Ref="U1"  Part="3" 
F 0 "U1" H 6900 4517 50  0000 C CNN
F 1 "TLV6004PW" H 6900 4426 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 6900 4150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlv9004.pdf" H 6950 4350 50  0001 C CNN
	3    6900 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4250 6500 4250
Wire Wire Line
	6500 4250 6500 4450
Wire Wire Line
	6500 4450 7300 4450
Wire Wire Line
	7300 4450 7300 4150
Wire Wire Line
	7300 4150 7200 4150
Wire Wire Line
	6600 4050 6350 4050
Wire Wire Line
	6050 4050 5950 4050
Wire Wire Line
	5950 4050 5950 4350
Connection ~ 5950 4350
$Comp
L Device:R R?
U 1 1 5F1CF420
P 7550 4150
AR Path="/5F1CF420" Ref="R?"  Part="1" 
AR Path="/5F15ED5B/5F1CF420" Ref="R11"  Part="1" 
F 0 "R11" V 7343 4150 50  0000 C CNN
F 1 "56.2k" V 7434 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7480 4150 50  0001 C CNN
F 3 "~" H 7550 4150 50  0001 C CNN
	1    7550 4150
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F1CF426
P 7800 3850
AR Path="/5F1CF426" Ref="R?"  Part="1" 
AR Path="/5F15ED5B/5F1CF426" Ref="R13"  Part="1" 
F 0 "R13" H 7870 3896 50  0000 L CNN
F 1 "10k" H 7870 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7730 3850 50  0001 C CNN
F 3 "~" H 7800 3850 50  0001 C CNN
	1    7800 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F1CF42C
P 7800 4400
AR Path="/5F1CF42C" Ref="C?"  Part="1" 
AR Path="/5F15ED5B/5F1CF42C" Ref="C9"  Part="1" 
F 0 "C9" H 7915 4446 50  0000 L CNN
F 1 "22u" H 7915 4355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7838 4250 50  0001 C CNN
F 3 "~" H 7800 4400 50  0001 C CNN
	1    7800 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 4150 7300 4150
Connection ~ 7300 4150
Wire Wire Line
	7700 4150 7800 4150
Wire Wire Line
	7800 4150 7800 4250
Wire Wire Line
	7800 4000 7800 4150
Connection ~ 7800 4150
Wire Wire Line
	8100 4150 7800 4150
Wire Wire Line
	5950 3450 7800 3450
Wire Wire Line
	7800 3450 7800 3700
Connection ~ 5950 3450
Wire Wire Line
	8100 3450 7800 3450
Connection ~ 7800 3450
$Comp
L Bertha_main-eagle-import:TLV6004PW U?
U 5 1 5F1CF440
P 4250 4100
AR Path="/5F1CF440" Ref="U?"  Part="5" 
AR Path="/5F15ED5B/5F1CF440" Ref="U1"  Part="5" 
F 0 "U1" H 4208 4146 50  0000 L CNN
F 1 "TLV6004PW" H 4208 4055 50  0000 L CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 4250 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlv9004.pdf" H 4300 4300 50  0001 C CNN
	5    4250 4100
	1    0    0    -1  
$EndComp
$Comp
L Bertha_main-eagle-import:GND #?
U 1 1 5F1CF446
P 4150 4650
AR Path="/5F1CF446" Ref="#?"  Part="1" 
AR Path="/5F15ED5B/5F1CF446" Ref="#0103"  Part="1" 
F 0 "#0103" H 4200 4700 50  0001 C CNN
F 1 "GND" H 4253 4688 42  0000 L CNN
F 2 "" H 4150 4650 50  0001 C CNN
F 3 "" H 4150 4650 50  0001 C CNN
	1    4150 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3800 4150 3700
Wire Wire Line
	4150 4550 4150 4450
$Comp
L Device:C C?
U 1 1 5F1CF44E
P 3850 4100
AR Path="/5F1CF44E" Ref="C?"  Part="1" 
AR Path="/5F15ED5B/5F1CF44E" Ref="C1"  Part="1" 
F 0 "C1" H 3965 4146 50  0000 L CNN
F 1 "100n" H 3965 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3888 3950 50  0001 C CNN
F 3 "~" H 3850 4100 50  0001 C CNN
	1    3850 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3700 3850 3700
Wire Wire Line
	3850 3700 3850 3950
Connection ~ 4150 3700
Wire Wire Line
	4150 3700 4150 3600
Wire Wire Line
	3850 4250 3850 4450
Wire Wire Line
	3850 4450 4150 4450
Connection ~ 4150 4450
Wire Wire Line
	4150 4450 4150 4400
$Comp
L Bertha_main-eagle-import:GND #U?
U 1 1 5F1CF45C
P 7800 4800
AR Path="/5F1CF45C" Ref="#U?"  Part="1" 
AR Path="/5F15ED5B/5F1CF45C" Ref="#U0101"  Part="1" 
F 0 "#U0101" H 7850 4850 50  0001 C CNN
F 1 "GND" H 7903 4838 42  0000 L CNN
F 2 "" H 7800 4800 50  0001 C CNN
F 3 "" H 7800 4800 50  0001 C CNN
	1    7800 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 4550 7800 4700
$Comp
L Bertha_main-eagle-import:TLV6004PW U?
U 1 1 5F1CF465
P 5550 4350
AR Path="/5F1CF465" Ref="U?"  Part="1" 
AR Path="/5F15ED5B/5F1CF465" Ref="U1"  Part="1" 
F 0 "U1" H 5550 4717 50  0000 C CNN
F 1 "TLV6004PW" H 5550 4626 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 5550 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlv9004.pdf" H 5600 4550 50  0001 C CNN
	1    5550 4350
	1    0    0    -1  
$EndComp
Text Notes 4275 3225 0    100  ~ 0
pH
$Comp
L Device:R R?
U 1 1 5F1CF46C
P 4900 4500
AR Path="/5F1CF46C" Ref="R?"  Part="1" 
AR Path="/5F15ED5B/5F1CF46C" Ref="R4"  Part="1" 
F 0 "R4" H 4970 4546 50  0000 L CNN
F 1 "10k" H 4970 4455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4830 4500 50  0001 C CNN
F 3 "~" H 4900 4500 50  0001 C CNN
	1    4900 4500
	1    0    0    -1  
$EndComp
Text HLabel 4150 3600 0    50   Input ~ 0
Vin
Text HLabel 4900 3750 0    50   Input ~ 0
Vin
Text HLabel 8100 4150 2    50   Input ~ 0
pH+
Text HLabel 8100 3450 2    50   Input ~ 0
pH-
$EndSCHEMATC
