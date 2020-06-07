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
L Device:R R?
U 1 1 5E02DBA6
P 6400 1900
F 0 "R?" V 6325 1900 50  0000 C CNN
F 1 "10k" V 6400 1900 50  0000 C CNN
F 2 "" V 6330 1900 50  0001 C CNN
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
Text GLabel 5500 4525 2    50   Input ~ 0
GND
Text GLabel 5500 4750 2    50   Input ~ 0
3.3V
Text GLabel 5500 4425 2    50   Input ~ 0
12V
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
L Device:C C?
U 1 1 5E060188
P 3375 4450
F 0 "C?" H 3490 4496 50  0000 L CNN
F 1 "100nF" H 3490 4405 50  0000 L CNN
F 2 "" H 3413 4300 50  0001 C CNN
F 3 "~" H 3375 4450 50  0001 C CNN
	1    3375 4450
	1    0    0    -1  
$EndComp
Text GLabel 3375 4200 0    50   Input ~ 0
AREF
Text GLabel 3375 4700 0    50   Input ~ 0
GND
Wire Wire Line
	3375 4200 3375 4300
Wire Wire Line
	3375 4600 3375 4700
$Comp
L Device:R R?
U 1 1 5E06947C
P 3825 3150
F 0 "R?" V 3925 3025 50  0000 L CNN
F 1 "1M" V 3825 3100 50  0000 L CNN
F 2 "" V 3755 3150 50  0001 C CNN
F 3 "~" H 3825 3150 50  0001 C CNN
	1    3825 3150
	1    0    0    -1  
$EndComp
$Comp
L Bertha_main-eagle-import:XTALNX6035 X?
U 1 1 5E06AC4E
P 3525 3150
F 0 "X?" V 3775 3250 50  0000 R CNN
F 1 "XTALNX6035" V 3225 3375 50  0000 R CNN
F 2 "" H 3525 3150 50  0001 C CNN
F 3 "" H 3525 3150 50  0001 C CNN
	1    3525 3150
	0    -1   -1   0   
$EndComp
Text Notes 3425 3550 0    55   ~ 0
8MHz\n
$Comp
L Device:C C?
U 1 1 5E06D522
P 3125 3050
F 0 "C?" V 2925 3050 50  0000 C CNN
F 1 "22pF" V 3000 3050 50  0000 C CNN
F 2 "" H 3163 2900 50  0001 C CNN
F 3 "~" H 3125 3050 50  0001 C CNN
	1    3125 3050
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5E06E8A5
P 3125 3250
F 0 "C?" V 3325 3250 50  0000 C CNN
F 1 "22pF" V 3250 3275 50  0000 C CNN
F 2 "" H 3163 3100 50  0001 C CNN
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
L Device:C C?
U 1 1 5E07E1BC
P 3625 2600
F 0 "C?" V 3575 2775 50  0000 C CNN
F 1 "100nF" V 3675 2775 50  0000 C CNN
F 2 "" H 3663 2450 50  0001 C CNN
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
L Device:C C?
U 1 1 5E0937A1
P 3625 2000
F 0 "C?" V 3825 2000 50  0000 C CNN
F 1 "100nF" V 3750 2000 50  0000 C CNN
F 2 "" H 3663 1850 50  0001 C CNN
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
L Device:R R?
U 1 1 5E0BADDD
P 3075 1000
F 0 "R?" V 3175 875 50  0000 L CNN
F 1 "10k" V 3075 925 50  0000 L CNN
F 2 "" V 3005 1000 50  0001 C CNN
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
L Bertha_main-eagle-import:SJ J?
U 1 1 5E0A3DEB
P 3075 1350
F 0 "J?" V 3000 1050 59  0000 L CNN
F 1 "SJ" V 3125 1175 59  0000 L CNN
F 2 "" H 3075 1350 50  0001 C CNN
F 3 "" H 3075 1350 50  0001 C CNN
	1    3075 1350
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5E0A09B6
P 3300 1350
F 0 "C?" H 3150 1275 50  0000 C CNN
F 1 "100nF" H 3175 1450 50  0000 C CNN
F 2 "" H 3338 1200 50  0001 C CNN
F 3 "~" H 3300 1350 50  0001 C CNN
	1    3300 1350
	-1   0    0    1   
$EndComp
$Comp
L bioreactor:ATMEGA32U4-AU U?
U 1 1 5EE14089
P 4950 2900
F 0 "U?" H 5000 4886 59  0000 C CNN
F 1 "ATMEGA32U4-AU" H 5000 4781 59  0000 C CNN
F 2 "" H 4950 2900 50  0001 C CNN
F 3 "" H 4950 2900 50  0001 C CNN
	1    4950 2900
	1    0    0    -1  
$EndComp
$Comp
L Bertha_main-eagle-import:M02JST-PTH-2 JP?
U 1 1 5EE193A9
P 5050 4425
F 0 "JP?" H 4922 4422 59  0000 R CNN
F 1 "M02JST-PTH-2" H 4922 4527 59  0000 R CNN
F 2 "" H 5050 4425 50  0001 C CNN
F 3 "" H 5050 4425 50  0001 C CNN
	1    5050 4425
	1    0    0    1   
$EndComp
$Comp
L Bertha_main-eagle-import:M02JST-PTH-2 JP?
U 1 1 5EE199A8
P 5050 4750
F 0 "JP?" H 4922 4747 59  0000 R CNN
F 1 "M02JST-PTH-2" H 4922 4852 59  0000 R CNN
F 2 "" H 5050 4750 50  0001 C CNN
F 3 "" H 5050 4750 50  0001 C CNN
	1    5050 4750
	1    0    0    1   
$EndComp
Text GLabel 5500 4850 2    50   Input ~ 0
GND
Wire Wire Line
	5500 4425 5350 4425
Wire Wire Line
	5350 4525 5500 4525
Wire Wire Line
	5500 4750 5350 4750
Wire Wire Line
	5500 4850 5350 4850
$EndSCHEMATC
