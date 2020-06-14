EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
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
L Device:C C?
U 1 1 5F37FF79
P 3650 3325
AR Path="/5F37FF79" Ref="C?"  Part="1" 
AR Path="/5F3634CD/5F37FF79" Ref="C4"  Part="1" 
F 0 "C4" V 3398 3325 50  0000 C CNN
F 1 "100n" V 3489 3325 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3688 3175 50  0001 C CNN
F 3 "~" H 3650 3325 50  0001 C CNN
	1    3650 3325
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5F37FF7F
P 2925 3800
AR Path="/5F37FF7F" Ref="C?"  Part="1" 
AR Path="/5F3634CD/5F37FF7F" Ref="C2"  Part="1" 
F 0 "C2" H 2810 3754 50  0000 R CNN
F 1 "100n" H 2810 3845 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2963 3650 50  0001 C CNN
F 3 "~" H 2925 3800 50  0001 C CNN
	1    2925 3800
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 5F37FF85
P 4025 4825
AR Path="/5F37FF85" Ref="C?"  Part="1" 
AR Path="/5F3634CD/5F37FF85" Ref="C5"  Part="1" 
F 0 "C5" V 4277 4825 50  0000 C CNN
F 1 "100n" V 4186 4825 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4063 4675 50  0001 C CNN
F 3 "~" H 4025 4825 50  0001 C CNN
	1    4025 4825
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5F37FF8B
P 6025 4025
AR Path="/5F37FF8B" Ref="C?"  Part="1" 
AR Path="/5F3634CD/5F37FF8B" Ref="C8"  Part="1" 
F 0 "C8" V 6277 4025 50  0000 C CNN
F 1 "100n" V 6186 4025 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6063 3875 50  0001 C CNN
F 3 "~" H 6025 4025 50  0001 C CNN
	1    6025 4025
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5F37FF91
P 8325 4600
AR Path="/5F37FF91" Ref="C?"  Part="1" 
AR Path="/5F3634CD/5F37FF91" Ref="C12"  Part="1" 
F 0 "C12" H 8210 4554 50  0000 R CNN
F 1 "100n" H 8210 4645 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8363 4450 50  0001 C CNN
F 3 "~" H 8325 4600 50  0001 C CNN
	1    8325 4600
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5F37FF97
P 2600 3800
AR Path="/5F37FF97" Ref="R?"  Part="1" 
AR Path="/5F3634CD/5F37FF97" Ref="R1"  Part="1" 
F 0 "R1" H 2670 3846 50  0000 L CNN
F 1 "1k" H 2670 3755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2530 3800 50  0001 C CNN
F 3 "~" H 2600 3800 50  0001 C CNN
	1    2600 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 3650 2600 3575
Wire Wire Line
	2600 3575 2925 3575
Wire Wire Line
	2925 3575 2925 3650
Wire Wire Line
	2600 3950 2600 4025
Wire Wire Line
	2600 4025 2925 4025
Wire Wire Line
	2925 4025 2925 3950
$Comp
L Bertha_main-eagle-import:GND #U?
U 1 1 5F37FFA3
P 2600 4200
AR Path="/5F37FFA3" Ref="#U?"  Part="1" 
AR Path="/5F3634CD/5F37FFA3" Ref="#U0102"  Part="1" 
F 0 "#U0102" H 2650 4250 50  0001 C CNN
F 1 "GND" H 2703 4238 42  0000 L CNN
F 2 "" H 2600 4200 50  0001 C CNN
F 3 "" H 2600 4200 50  0001 C CNN
	1    2600 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4100 2600 4025
Connection ~ 2600 4025
Wire Wire Line
	3075 4025 2925 4025
Connection ~ 2925 4025
Wire Wire Line
	3475 4025 3425 4025
Wire Wire Line
	3475 3825 3425 3825
Wire Wire Line
	3425 3825 3425 3575
Wire Wire Line
	3425 3575 2925 3575
Connection ~ 2925 3575
$Comp
L Device:R R?
U 1 1 5F37FFB2
P 4025 3325
AR Path="/5F37FFB2" Ref="R?"  Part="1" 
AR Path="/5F3634CD/5F37FFB2" Ref="R6"  Part="1" 
F 0 "R6" V 3818 3325 50  0000 C CNN
F 1 "1k" V 3909 3325 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3955 3325 50  0001 C CNN
F 3 "~" H 4025 3325 50  0001 C CNN
	1    4025 3325
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 3325 3425 3325
Wire Wire Line
	3425 3325 3425 3575
Connection ~ 3425 3575
Wire Wire Line
	3800 3325 3875 3325
Wire Wire Line
	4175 3325 4225 3325
Wire Wire Line
	4225 3325 4225 3925
Wire Wire Line
	4225 3925 4075 3925
$Comp
L Device:R R?
U 1 1 5F37FFBF
P 3825 4375
AR Path="/5F37FFBF" Ref="R?"  Part="1" 
AR Path="/5F3634CD/5F37FFBF" Ref="R5"  Part="1" 
F 0 "R5" V 3618 4375 50  0000 C CNN
F 1 "22k" V 3709 4375 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3755 4375 50  0001 C CNN
F 3 "~" H 3825 4375 50  0001 C CNN
	1    3825 4375
	0    1    1    0   
$EndComp
Wire Wire Line
	4225 3925 4225 4375
Wire Wire Line
	4225 4375 3975 4375
Connection ~ 4225 3925
Wire Wire Line
	3675 4375 3425 4375
Wire Wire Line
	3425 4375 3425 4025
Connection ~ 3425 4025
Wire Wire Line
	3425 4025 3375 4025
Wire Wire Line
	4225 4825 4225 4375
Connection ~ 4225 4375
Wire Wire Line
	4175 4825 4225 4825
$Comp
L Device:D D?
U 1 1 5F37FFCF
P 3625 4650
AR Path="/5F37FFCF" Ref="D?"  Part="1" 
AR Path="/5F3634CD/5F37FFCF" Ref="D1"  Part="1" 
F 0 "D1" H 3625 4867 50  0000 C CNN
F 1 "D" H 3625 4776 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 3625 4650 50  0001 C CNN
F 3 "~" H 3625 4650 50  0001 C CNN
	1    3625 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:D D?
U 1 1 5F37FFD5
P 3625 4975
AR Path="/5F37FFD5" Ref="D?"  Part="1" 
AR Path="/5F3634CD/5F37FFD5" Ref="D2"  Part="1" 
F 0 "D2" H 3625 4758 50  0000 C CNN
F 1 "D" H 3625 4849 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 3625 4975 50  0001 C CNN
F 3 "~" H 3625 4975 50  0001 C CNN
	1    3625 4975
	-1   0    0    1   
$EndComp
Wire Wire Line
	3875 4825 3825 4825
Wire Wire Line
	3825 4825 3825 4650
Wire Wire Line
	3825 4650 3775 4650
Wire Wire Line
	3775 4975 3825 4975
Wire Wire Line
	3825 4975 3825 4825
Connection ~ 3825 4825
Wire Wire Line
	3475 4650 3425 4650
Wire Wire Line
	3425 4650 3425 4375
Connection ~ 3425 4375
Wire Wire Line
	3475 4975 3425 4975
Wire Wire Line
	3425 4975 3425 4650
Connection ~ 3425 4650
$Comp
L Device:R R?
U 1 1 5F37FFE7
P 4425 3925
AR Path="/5F37FFE7" Ref="R?"  Part="1" 
AR Path="/5F3634CD/5F37FFE7" Ref="R7"  Part="1" 
F 0 "R7" V 4218 3925 50  0000 C CNN
F 1 "1k" V 4309 3925 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4355 3925 50  0001 C CNN
F 3 "~" H 4425 3925 50  0001 C CNN
	1    4425 3925
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F37FFED
P 4625 4125
AR Path="/5F37FFED" Ref="R?"  Part="1" 
AR Path="/5F3634CD/5F37FFED" Ref="R8"  Part="1" 
F 0 "R8" H 4555 4079 50  0000 R CNN
F 1 "1k" H 4555 4170 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4555 4125 50  0001 C CNN
F 3 "~" H 4625 4125 50  0001 C CNN
	1    4625 4125
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_Coaxial_Power J?
U 1 1 5F37FFF3
P 4975 4300
AR Path="/5F37FFF3" Ref="J?"  Part="1" 
AR Path="/5F3634CD/5F37FFF3" Ref="J2"  Part="1" 
F 0 "J2" V 4900 4350 50  0000 C CNN
F 1 "Conn_Coaxial_Power" V 5100 4250 50  0000 C CNN
F 2 "Connector_Coaxial:BNC_TEConnectivity_1478204_Vertical" H 4975 4250 50  0001 C CNN
F 3 "~" H 4975 4250 50  0001 C CNN
	1    4975 4300
	-1   0    0    -1  
$EndComp
$Comp
L Bertha_main-eagle-import:GND #U?
U 1 1 5F37FFF9
P 4625 4475
AR Path="/5F37FFF9" Ref="#U?"  Part="1" 
AR Path="/5F3634CD/5F37FFF9" Ref="#U0103"  Part="1" 
F 0 "#U0103" H 4675 4525 50  0001 C CNN
F 1 "GND" H 4450 4525 42  0000 L CNN
F 2 "" H 4625 4475 50  0001 C CNN
F 3 "" H 4625 4475 50  0001 C CNN
	1    4625 4475
	1    0    0    -1  
$EndComp
$Comp
L Bertha_main-eagle-import:GND #U?
U 1 1 5F37FFFF
P 4975 4675
AR Path="/5F37FFFF" Ref="#U?"  Part="1" 
AR Path="/5F3634CD/5F37FFFF" Ref="#U0104"  Part="1" 
F 0 "#U0104" H 5025 4725 50  0001 C CNN
F 1 "GND" H 5025 4725 42  0000 L CNN
F 2 "" H 4975 4675 50  0001 C CNN
F 3 "" H 4975 4675 50  0001 C CNN
	1    4975 4675
	1    0    0    -1  
$EndComp
Wire Wire Line
	4625 4275 4625 4375
Wire Wire Line
	4625 3975 4625 3925
Wire Wire Line
	4625 3925 4575 3925
Wire Wire Line
	4275 3925 4225 3925
$Comp
L Connector:TestPoint TP?
U 1 1 5F380009
P 4625 3850
AR Path="/5F380009" Ref="TP?"  Part="1" 
AR Path="/5F3634CD/5F380009" Ref="TP1"  Part="1" 
F 0 "TP1" H 4683 3968 50  0000 L CNN
F 1 "TestPoint" H 4683 3877 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 4825 3850 50  0001 C CNN
F 3 "~" H 4825 3850 50  0001 C CNN
	1    4625 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4625 3850 4625 3925
Connection ~ 4625 3925
$Comp
L Bertha_main-eagle-import:TLV6004PW U?
U 2 1 5F380011
P 5450 4025
AR Path="/5F380011" Ref="U?"  Part="2" 
AR Path="/5F3634CD/5F380011" Ref="U2"  Part="2" 
F 0 "U2" H 5450 4392 50  0000 C CNN
F 1 "TLV6004PW" H 5450 4301 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 5450 4025 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlv9004.pdf" H 5500 4225 50  0001 C CNN
	2    5450 4025
	1    0    0    -1  
$EndComp
Wire Wire Line
	4625 3925 5150 3925
Wire Wire Line
	4975 4575 4975 4500
Wire Wire Line
	4975 4200 4975 4125
Wire Wire Line
	4975 4125 5100 4125
$Comp
L Device:R R?
U 1 1 5F38001B
P 5400 4450
AR Path="/5F38001B" Ref="R?"  Part="1" 
AR Path="/5F3634CD/5F38001B" Ref="R9"  Part="1" 
F 0 "R9" V 5193 4450 50  0000 C CNN
F 1 "1k" V 5284 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5330 4450 50  0001 C CNN
F 3 "~" H 5400 4450 50  0001 C CNN
	1    5400 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 4450 5100 4450
Wire Wire Line
	5100 4450 5100 4125
Connection ~ 5100 4125
Wire Wire Line
	5100 4125 5150 4125
Wire Wire Line
	5550 4450 5800 4450
Wire Wire Line
	5800 4450 5800 4025
Wire Wire Line
	5800 4025 5750 4025
$Comp
L Bertha_main-eagle-import:TLV6004PW U?
U 5 1 5F380028
P 8125 3575
AR Path="/5F380028" Ref="U?"  Part="5" 
AR Path="/5F3634CD/5F380028" Ref="U2"  Part="5" 
F 0 "U2" H 8083 3621 50  0000 L CNN
F 1 "TLV6004PW" H 8083 3530 50  0000 L CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 8125 3575 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlv9004.pdf" H 8175 3775 50  0001 C CNN
	5    8125 3575
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F38002F
P 7650 3575
AR Path="/5F38002F" Ref="C?"  Part="1" 
AR Path="/5F3634CD/5F38002F" Ref="C10"  Part="1" 
F 0 "C10" H 7765 3621 50  0000 L CNN
F 1 "100n" H 7765 3530 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7688 3425 50  0001 C CNN
F 3 "~" H 7650 3575 50  0001 C CNN
	1    7650 3575
	1    0    0    -1  
$EndComp
$Comp
L Bertha_main-eagle-import:GND #U?
U 1 1 5F380035
P 8025 4075
AR Path="/5F380035" Ref="#U?"  Part="1" 
AR Path="/5F3634CD/5F380035" Ref="#U0105"  Part="1" 
F 0 "#U0105" H 8075 4125 50  0001 C CNN
F 1 "GND" H 8128 4113 42  0000 L CNN
F 2 "" H 8025 4075 50  0001 C CNN
F 3 "" H 8025 4075 50  0001 C CNN
	1    8025 4075
	1    0    0    -1  
$EndComp
Wire Wire Line
	8025 3975 8025 3925
Wire Wire Line
	8025 3275 8025 3225
Wire Wire Line
	7650 3425 7650 3225
Wire Wire Line
	7650 3225 8025 3225
Connection ~ 8025 3225
Wire Wire Line
	7650 3725 7650 3925
Wire Wire Line
	7650 3925 8025 3925
Connection ~ 8025 3925
Wire Wire Line
	8025 3925 8025 3875
$Comp
L Device:R R?
U 1 1 5F380045
P 6250 4225
AR Path="/5F380045" Ref="R?"  Part="1" 
AR Path="/5F3634CD/5F380045" Ref="R10"  Part="1" 
F 0 "R10" H 6180 4179 50  0000 R CNN
F 1 "1k" H 6180 4270 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6180 4225 50  0001 C CNN
F 3 "~" H 6250 4225 50  0001 C CNN
	1    6250 4225
	-1   0    0    1   
$EndComp
Wire Wire Line
	5875 4025 5800 4025
Connection ~ 5800 4025
Wire Wire Line
	6175 4025 6250 4025
Wire Wire Line
	6250 4025 6250 4075
$Comp
L Bertha_main-eagle-import:TLV6004PW U?
U 3 1 5F38004F
P 7050 4125
AR Path="/5F38004F" Ref="U?"  Part="3" 
AR Path="/5F3634CD/5F38004F" Ref="U2"  Part="3" 
F 0 "U2" H 7050 4492 50  0000 C CNN
F 1 "TLV6004PW" H 7050 4401 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 7050 4125 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlv9004.pdf" H 7100 4325 50  0001 C CNN
	3    7050 4125
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F380055
P 6475 4425
AR Path="/5F380055" Ref="R?"  Part="1" 
AR Path="/5F3634CD/5F380055" Ref="R12"  Part="1" 
F 0 "R12" H 6405 4379 50  0000 R CNN
F 1 "1k" H 6405 4470 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6405 4425 50  0001 C CNN
F 3 "~" H 6475 4425 50  0001 C CNN
	1    6475 4425
	-1   0    0    1   
$EndComp
Wire Wire Line
	6750 4025 6250 4025
Connection ~ 6250 4025
Wire Wire Line
	6750 4225 6700 4225
Wire Wire Line
	6475 4225 6475 4275
$Comp
L Bertha_main-eagle-import:GND #U?
U 1 1 5F38005F
P 6250 4575
AR Path="/5F38005F" Ref="#U?"  Part="1" 
AR Path="/5F3634CD/5F38005F" Ref="#U0106"  Part="1" 
F 0 "#U0106" H 6300 4625 50  0001 C CNN
F 1 "GND" H 6300 4625 42  0000 L CNN
F 2 "" H 6250 4575 50  0001 C CNN
F 3 "" H 6250 4575 50  0001 C CNN
	1    6250 4575
	1    0    0    -1  
$EndComp
$Comp
L Bertha_main-eagle-import:GND #U?
U 1 1 5F380065
P 6475 4750
AR Path="/5F380065" Ref="#U?"  Part="1" 
AR Path="/5F3634CD/5F380065" Ref="#U0107"  Part="1" 
F 0 "#U0107" H 6525 4800 50  0001 C CNN
F 1 "GND" H 6525 4800 42  0000 L CNN
F 2 "" H 6475 4750 50  0001 C CNN
F 3 "" H 6475 4750 50  0001 C CNN
	1    6475 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6475 4650 6475 4575
Wire Wire Line
	6250 4475 6250 4375
$Comp
L Diode_Bridge:MB2S D?
U 1 1 5F38006D
P 7350 4600
AR Path="/5F38006D" Ref="D?"  Part="1" 
AR Path="/5F3634CD/5F38006D" Ref="D6"  Part="1" 
F 0 "D6" H 7100 4775 50  0000 L CNN
F 1 "MB2S" H 7500 4775 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-269AA" H 7500 4725 50  0001 L CNN
F 3 "http://www.vishay.com/docs/88661/mb2s.pdf" H 7350 4600 50  0001 C CNN
	1    7350 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 4225 6700 4600
Wire Wire Line
	6700 4600 7050 4600
Connection ~ 6700 4225
Wire Wire Line
	6700 4225 6475 4225
$Comp
L Device:R R?
U 1 1 5F380077
P 8025 4600
AR Path="/5F380077" Ref="R?"  Part="1" 
AR Path="/5F3634CD/5F380077" Ref="R17"  Part="1" 
F 0 "R17" H 7955 4554 50  0000 R CNN
F 1 "1k" H 7955 4645 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7955 4600 50  0001 C CNN
F 3 "~" H 8025 4600 50  0001 C CNN
	1    8025 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	7650 4600 7725 4600
Wire Wire Line
	7725 4600 7725 4125
Wire Wire Line
	7725 4125 7350 4125
Wire Wire Line
	7350 4300 7350 4250
Wire Wire Line
	7350 4250 8025 4250
Wire Wire Line
	8025 4250 8025 4450
Wire Wire Line
	8325 4450 8325 4250
Wire Wire Line
	8325 4250 8025 4250
Connection ~ 8025 4250
Wire Wire Line
	7350 4900 7350 4950
Wire Wire Line
	7350 4950 8025 4950
Wire Wire Line
	8325 4950 8325 4750
Wire Wire Line
	8025 4750 8025 4950
Connection ~ 8025 4950
Wire Wire Line
	8025 4950 8325 4950
$Comp
L Device:R R?
U 1 1 5F38008C
P 8325 4050
AR Path="/5F38008C" Ref="R?"  Part="1" 
AR Path="/5F3634CD/5F38008C" Ref="R18"  Part="1" 
F 0 "R18" H 8255 4004 50  0000 R CNN
F 1 "1k" H 8255 4095 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8255 4050 50  0001 C CNN
F 3 "~" H 8325 4050 50  0001 C CNN
	1    8325 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5F380092
P 8700 4600
AR Path="/5F380092" Ref="R?"  Part="1" 
AR Path="/5F3634CD/5F380092" Ref="R19"  Part="1" 
F 0 "R19" H 8630 4554 50  0000 R CNN
F 1 "1k" H 8630 4645 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8630 4600 50  0001 C CNN
F 3 "~" H 8700 4600 50  0001 C CNN
	1    8700 4600
	-1   0    0    1   
$EndComp
$Comp
L Bertha_main-eagle-import:TLV6004PW U?
U 4 1 5F380098
P 9075 3925
AR Path="/5F380098" Ref="U?"  Part="4" 
AR Path="/5F3634CD/5F380098" Ref="U2"  Part="4" 
F 0 "U2" H 9075 4292 50  0000 C CNN
F 1 "TLV6004PW" H 9075 4201 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 9075 3925 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlv9004.pdf" H 9125 4125 50  0001 C CNN
	4    9075 3925
	1    0    0    -1  
$EndComp
Wire Wire Line
	8775 3825 8325 3825
Wire Wire Line
	8325 3825 8325 3900
Wire Wire Line
	8325 4200 8325 4250
Connection ~ 8325 4250
Wire Wire Line
	8775 4025 8700 4025
Wire Wire Line
	8700 4025 8700 4375
Wire Wire Line
	8700 4750 8700 4950
Wire Wire Line
	8700 4950 8325 4950
Connection ~ 8325 4950
$Comp
L Device:R R?
U 1 1 5F3800A7
P 9125 4375
AR Path="/5F3800A7" Ref="R?"  Part="1" 
AR Path="/5F3634CD/5F3800A7" Ref="R22"  Part="1" 
F 0 "R22" V 9332 4375 50  0000 C CNN
F 1 "1k" V 9241 4375 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9055 4375 50  0001 C CNN
F 3 "~" H 9125 4375 50  0001 C CNN
	1    9125 4375
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8975 4375 8700 4375
Connection ~ 8700 4375
Wire Wire Line
	8700 4375 8700 4450
Wire Wire Line
	9275 4375 9450 4375
Wire Wire Line
	9450 4375 9450 3925
Wire Wire Line
	9450 3925 9375 3925
Connection ~ 9450 3925
$Comp
L Device:R R?
U 1 1 5F3800B6
P 3225 4025
AR Path="/5F3800B6" Ref="R?"  Part="1" 
AR Path="/5F3634CD/5F3800B6" Ref="R2"  Part="1" 
F 0 "R2" V 3125 4025 50  0000 C CNN
F 1 "10k" V 3050 4025 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3155 4025 50  0001 C CNN
F 3 "~" H 3225 4025 50  0001 C CNN
	1    3225 4025
	0    1    -1   0   
$EndComp
Text Notes 5025 3250 0    100  ~ 0
Conductometer
$Comp
L Bertha_main-eagle-import:TLV6004PW U?
U 1 1 5F3800BD
P 3775 3925
AR Path="/5F3800BD" Ref="U?"  Part="1" 
AR Path="/5F3634CD/5F3800BD" Ref="U2"  Part="1" 
F 0 "U2" H 3775 4292 50  0000 C CNN
F 1 "TLV6004PW" H 3775 4201 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 3775 3925 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlv9004.pdf" H 3825 4125 50  0001 C CNN
	1    3775 3925
	1    0    0    -1  
$EndComp
Text HLabel 8025 3125 0    50   Input ~ 0
VIn
Text HLabel 9550 3925 2    50   Input ~ 0
VOut
Wire Wire Line
	8025 3125 8025 3225
Wire Wire Line
	9450 3925 9550 3925
$EndSCHEMATC
