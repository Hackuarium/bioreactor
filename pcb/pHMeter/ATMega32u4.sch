EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title "Bertha"
Date "2019-12-03"
Rev ""
Comp "Hackuarium"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 6100 1200 2    50   Input ~ 0
A5
Text GLabel 6100 1300 2    50   Input ~ 0
A4
Text GLabel 6100 1400 2    50   Input ~ 0
A3
Text GLabel 6100 1500 2    50   Input ~ 0
A2
Text GLabel 6100 1600 2    50   Input ~ 0
A1
Text GLabel 6100 1700 2    50   Input ~ 0
A0
$Comp
L Device:R R31
U 1 1 5E02DBA6
P 6400 1900
F 0 "R31" V 6325 1900 50  0000 C CNN
F 1 "10k" V 6400 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6330 1900 50  0001 C CNN
F 3 "~" H 6400 1900 50  0001 C CNN
	1    6400 1900
	0    1    1    0   
$EndComp
Text GLabel 6000 1825 2    50   Input ~ 0
HWB
Wire Wire Line
	5950 1700 6100 1700
Wire Wire Line
	6100 1600 5950 1600
Wire Wire Line
	5950 1500 6100 1500
Wire Wire Line
	6100 1400 5950 1400
Wire Wire Line
	5950 1300 6100 1300
Wire Wire Line
	6100 1200 5950 1200
Wire Wire Line
	5950 1900 6000 1900
Wire Wire Line
	6000 1825 6000 1900
Connection ~ 6000 1900
Wire Wire Line
	6000 1900 6250 1900
Text GLabel 6625 1900 2    50   Input ~ 0
GND
Wire Wire Line
	6625 1900 6550 1900
Text GLabel 6100 2000 2    50   Input ~ 0
D7
Text GLabel 6100 2200 2    50   Input ~ 0
D5
Text GLabel 6100 2300 2    50   Input ~ 0
D13
Text GLabel 6100 2500 2    50   Input ~ 0
D11
Text GLabel 6100 2600 2    50   Input ~ 0
D10
Text GLabel 6100 2700 2    50   Input ~ 0
D9
Text GLabel 6100 2800 2    50   Input ~ 0
D8
Text GLabel 6100 2900 2    50   Input ~ 0
MISO
Text GLabel 6100 3000 2    50   Input ~ 0
MOSI
Wire Wire Line
	5950 2000 6100 2000
Wire Wire Line
	6100 2200 5950 2200
Wire Wire Line
	5950 2300 6100 2300
Wire Wire Line
	6100 2500 5950 2500
Wire Wire Line
	5950 2600 6100 2600
Wire Wire Line
	6100 2700 5950 2700
Wire Wire Line
	5950 2800 6100 2800
Wire Wire Line
	6100 2900 5950 2900
Wire Wire Line
	5950 3000 6100 3000
Text GLabel 6100 3100 2    50   Input ~ 0
SCK
Text GLabel 6100 3200 2    50   Input ~ 0
RXLED
Text GLabel 6100 3400 2    50   Input ~ 0
D6
Text GLabel 6100 3500 2    50   Input ~ 0
D12
Text GLabel 6100 3600 2    50   Input ~ 0
TXLED
Text GLabel 6100 3700 2    50   Input ~ 0
A6
Text GLabel 6100 3800 2    50   Input ~ 0
TX
Wire Wire Line
	6100 3100 5950 3100
Wire Wire Line
	5950 3200 6100 3200
Wire Wire Line
	6100 3400 5950 3400
Wire Wire Line
	5950 3500 6100 3500
Wire Wire Line
	6100 3600 5950 3600
Wire Wire Line
	5950 3700 6100 3700
Wire Wire Line
	6100 3800 5950 3800
Text GLabel 6100 3900 2    50   Input ~ 0
RX
Text GLabel 6100 4000 2    50   Input ~ 0
SDA
Text GLabel 6100 4100 2    50   Input ~ 0
SCL
Wire Wire Line
	6100 3900 5950 3900
Wire Wire Line
	5950 4000 6100 4000
Wire Wire Line
	6100 4100 5950 4100
Text GLabel 5525 4400 2    50   Input ~ 0
3.3V
Text GLabel 3925 3850 0    50   Input ~ 0
GND
Wire Wire Line
	4000 3800 4050 3800
Wire Wire Line
	4000 4100 4050 4100
Wire Wire Line
	4000 3900 4050 3900
Connection ~ 4000 3900
Wire Wire Line
	4000 3900 4000 3850
Wire Wire Line
	4050 4000 4000 4000
Connection ~ 4000 4000
Wire Wire Line
	4000 4000 4000 4100
Wire Wire Line
	4000 3800 4000 3600
Wire Wire Line
	4000 3600 4050 3600
Connection ~ 4000 3800
Wire Wire Line
	4000 3900 4000 4000
Wire Wire Line
	3925 3850 4000 3850
Connection ~ 4000 3850
Wire Wire Line
	4000 3850 4000 3800
$Comp
L Device:C C16
U 1 1 5E060188
P 3375 4450
F 0 "C16" H 3490 4496 50  0000 L CNN
F 1 "100nF" H 3490 4405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3413 4300 50  0001 C CNN
F 3 "~" H 3375 4450 50  0001 C CNN
	1    3375 4450
	1    0    0    -1  
$EndComp
Text GLabel 3375 4200 0    50   Input ~ 0
AREF
Text GLabel 3375 4700 0    50   Input ~ 0
GND
Wire Wire Line
	3375 4600 3375 4700
$Comp
L Device:R R30
U 1 1 5E06947C
P 3825 3150
F 0 "R30" V 3925 3025 50  0000 L CNN
F 1 "1M" V 3825 3100 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3755 3150 50  0001 C CNN
F 3 "~" H 3825 3150 50  0001 C CNN
	1    3825 3150
	1    0    0    -1  
$EndComp
$Comp
L Bertha_main-eagle-import:XTALNX6035 X2
U 1 1 5E06AC4E
P 3525 3150
F 0 "X2" V 3775 3250 50  0000 R CNN
F 1 "XTALNX6035" V 3225 3375 50  0000 R CNN
F 2 "Crystal:Crystal_SMD_0603-2Pin_6.0x3.5mm_HandSoldering" H 3525 3150 50  0001 C CNN
F 3 "" H 3525 3150 50  0001 C CNN
	1    3525 3150
	0    -1   -1   0   
$EndComp
Text Notes 3425 3550 0    55   ~ 0
8MHz\n
$Comp
L Device:C C13
U 1 1 5E06D522
P 3125 3050
F 0 "C13" V 2925 3050 50  0000 C CNN
F 1 "22pF" V 3000 3050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3163 2900 50  0001 C CNN
F 3 "~" H 3125 3050 50  0001 C CNN
	1    3125 3050
	0    1    1    0   
$EndComp
$Comp
L Device:C C14
U 1 1 5E06E8A5
P 3125 3250
F 0 "C14" V 3325 3250 50  0000 C CNN
F 1 "22pF" V 3250 3275 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3163 3100 50  0001 C CNN
F 3 "~" H 3125 3250 50  0001 C CNN
	1    3125 3250
	0    1    1    0   
$EndComp
Text GLabel 2925 3150 0    50   Input ~ 0
GND
Wire Wire Line
	2975 3050 2975 3150
Wire Wire Line
	2925 3150 2975 3150
Connection ~ 2975 3150
Wire Wire Line
	2975 3150 2975 3250
Wire Wire Line
	3275 3050 3275 2950
Wire Wire Line
	3275 2950 3525 2950
Wire Wire Line
	3275 3250 3275 3350
Wire Wire Line
	3275 3350 3525 3350
Wire Wire Line
	3525 2950 3675 2950
Wire Wire Line
	3675 2950 3675 3000
Wire Wire Line
	3675 3000 3825 3000
Connection ~ 3525 2950
Wire Wire Line
	3525 3350 3675 3350
Wire Wire Line
	3675 3350 3675 3300
Wire Wire Line
	3675 3300 3825 3300
Connection ~ 3525 3350
Wire Wire Line
	3825 3000 4050 3000
Connection ~ 3825 3000
Wire Wire Line
	3825 3300 4050 3300
Connection ~ 3825 3300
Text GLabel 3950 2800 0    50   Input ~ 0
AREF
Wire Wire Line
	4050 2800 3950 2800
$Comp
L Device:C C18
U 1 1 5E07E1BC
P 3625 2600
F 0 "C18" V 3575 2775 50  0000 C CNN
F 1 "100nF" V 3675 2775 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3663 2450 50  0001 C CNN
F 3 "~" H 3625 2600 50  0001 C CNN
	1    3625 2600
	0    1    1    0   
$EndComp
Text GLabel 3925 2400 0    50   Input ~ 0
USB_P
Text GLabel 3925 2300 0    50   Input ~ 0
USB_N
Text GLabel 3400 2600 0    50   Input ~ 0
GND
Wire Wire Line
	3400 2600 3475 2600
Wire Wire Line
	3775 2600 4050 2600
Wire Wire Line
	3925 2400 4050 2400
Wire Wire Line
	4050 2300 3925 2300
Text GLabel 3925 1400 0    50   Input ~ 0
VUSB
Wire Wire Line
	3925 1400 4050 1400
Text GLabel 3925 1625 0    50   Input ~ 0
3.3V
Wire Wire Line
	3925 1625 3925 1700
Wire Wire Line
	3925 1700 4050 1700
Wire Wire Line
	3925 1700 3925 1800
Wire Wire Line
	3925 1800 4050 1800
Connection ~ 3925 1700
Wire Wire Line
	3925 1800 3925 1900
Wire Wire Line
	3925 1900 4050 1900
Connection ~ 3925 1800
Wire Wire Line
	3925 1900 3925 2100
Wire Wire Line
	3925 2100 4050 2100
Connection ~ 3925 1900
Text GLabel 3825 1825 0    50   Input ~ 0
3.3V
$Comp
L Device:C C17
U 1 1 5E0937A1
P 3625 2000
F 0 "C17" V 3825 2000 50  0000 C CNN
F 1 "100nF" V 3750 2000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3663 1850 50  0001 C CNN
F 3 "~" H 3625 2000 50  0001 C CNN
	1    3625 2000
	0    1    1    0   
$EndComp
Text GLabel 3400 2000 0    50   Input ~ 0
GND
Wire Wire Line
	3775 2000 3825 2000
Wire Wire Line
	3825 1825 3825 2000
Connection ~ 3825 2000
Wire Wire Line
	3825 2000 4050 2000
Wire Wire Line
	3475 2000 3400 2000
Text GLabel 3650 1125 2    50   Input ~ 0
RESET
Wire Wire Line
	3650 1125 3600 1125
Wire Wire Line
	3600 1125 3600 1200
Wire Wire Line
	3600 1200 4050 1200
Text Notes 7725 7025 0    315  ~ 0
ATMega32u4
Connection ~ 3600 1200
Wire Wire Line
	3075 1200 3300 1200
Connection ~ 3075 1200
Wire Wire Line
	3075 1150 3075 1200
Wire Wire Line
	3150 850  3075 850 
Text GLabel 3150 850  2    50   Input ~ 0
3.3V
$Comp
L Device:R R29
U 1 1 5E0BADDD
P 3075 1000
F 0 "R29" V 3175 875 50  0000 L CNN
F 1 "10k" V 3075 925 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3005 1000 50  0001 C CNN
F 3 "~" H 3075 1000 50  0001 C CNN
	1    3075 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3075 1500 3075 1575
Connection ~ 3075 1500
Wire Wire Line
	3300 1500 3075 1500
Wire Wire Line
	3075 1450 3075 1500
Text GLabel 3075 1575 0    50   Input ~ 0
GND
Connection ~ 3300 1200
Wire Wire Line
	3075 1200 3075 1250
Wire Wire Line
	3300 1200 3600 1200
$Comp
L Bertha_main-eagle-import:SJ J7
U 1 1 5E0A3DEB
P 3075 1350
F 0 "J7" V 3000 1050 59  0000 L CNN
F 1 "SJ" V 3125 1175 59  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3075 1350 50  0001 C CNN
F 3 "" H 3075 1350 50  0001 C CNN
	1    3075 1350
	0    1    1    0   
$EndComp
$Comp
L Device:C C15
U 1 1 5E0A09B6
P 3300 1350
F 0 "C15" H 3150 1275 50  0000 C CNN
F 1 "100nF" H 3175 1450 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3338 1200 50  0001 C CNN
F 3 "~" H 3300 1350 50  0001 C CNN
	1    3300 1350
	-1   0    0    1   
$EndComp
$Comp
L Bertha_main-eagle-import:M02JST-PTH-2 JP5
U 1 1 5EE199A8
P 5075 4400
F 0 "JP5" H 4947 4397 59  0000 R CNN
F 1 "M02JST-PTH-2" H 4947 4502 59  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5075 4400 50  0001 C CNN
F 3 "" H 5075 4400 50  0001 C CNN
	1    5075 4400
	1    0    0    1   
$EndComp
Text GLabel 5525 4500 2    50   Input ~ 0
GND
Wire Wire Line
	5525 4400 5375 4400
Wire Wire Line
	5525 4500 5375 4500
Wire Wire Line
	3375 4300 3375 4200
$Comp
L bioreactor:ATMEGA32U4-AU U3
U 1 1 5EE17B1A
P 4950 2900
F 0 "U3" H 5000 4886 59  0000 C CNN
F 1 "ATMEGA32U4-AU" H 5000 4781 59  0000 C CNN
F 2 "Package_QFP:TQFP-44_10x10mm_P0.8mm" H 4950 2900 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7766-8-bit-AVR-ATmega16U4-32U4_Datasheet.pdf" H 4950 2900 50  0001 C CNN
	1    4950 2900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
