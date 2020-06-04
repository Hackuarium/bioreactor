EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
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
L Bertha_main-eagle-import:SST25VF064C ?
U 1 1 5ED9C07F
P 4950 2425
F 0 "?" H 4950 2872 42  0000 C CNN
F 1 "SST25VF064C" H 4950 2793 42  0000 C CNN
F 2 "" H 4950 2425 50  0001 C CNN
F 3 "" H 4950 2425 50  0001 C CNN
	1    4950 2425
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5ED9D572
P 4100 2225
F 0 "R?" V 3893 2225 50  0000 C CNN
F 1 "1k" V 3984 2225 50  0000 C CNN
F 2 "" V 4030 2225 50  0001 C CNN
F 3 "~" H 4100 2225 50  0001 C CNN
	1    4100 2225
	0    1    1    0   
$EndComp
Text HLabel 3850 2225 0    50   Input ~ 0
CE
Text HLabel 3850 2325 0    50   Input ~ 0
MISO
Text HLabel 3850 2425 0    50   Input ~ 0
3.3V
Text HLabel 3850 2525 0    50   Input ~ 0
GND
Wire Wire Line
	3850 2525 4350 2525
Wire Wire Line
	3850 2425 4350 2425
Wire Wire Line
	3850 2325 4350 2325
Wire Wire Line
	4350 2225 4250 2225
Wire Wire Line
	3950 2225 3850 2225
Text HLabel 5675 2075 1    50   Input ~ 0
3.3V
Wire Wire Line
	5550 2225 5675 2225
Wire Wire Line
	5550 2325 5675 2325
Wire Wire Line
	5675 2075 5675 2225
Connection ~ 5675 2225
Wire Wire Line
	5675 2225 5675 2325
$Comp
L Device:R R?
U 1 1 5ED9EBD2
P 5800 2425
F 0 "R?" V 5593 2425 50  0000 C CNN
F 1 "1k" V 5684 2425 50  0000 C CNN
F 2 "" V 5730 2425 50  0001 C CNN
F 3 "~" H 5800 2425 50  0001 C CNN
	1    5800 2425
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 2425 5550 2425
Text HLabel 6025 2425 2    50   Input ~ 0
SCK
Wire Wire Line
	5950 2425 6025 2425
$Comp
L Device:R R?
U 1 1 5EDA07BC
P 6375 2325
F 0 "R?" H 6305 2279 50  0000 R CNN
F 1 "1k" H 6305 2370 50  0000 R CNN
F 2 "" V 6305 2325 50  0001 C CNN
F 3 "~" H 6375 2325 50  0001 C CNN
	1    6375 2325
	-1   0    0    1   
$EndComp
Wire Wire Line
	5550 2525 6375 2525
Wire Wire Line
	6375 2525 6375 2475
Text HLabel 6375 2075 1    50   Input ~ 0
3.3V
Wire Wire Line
	6375 2075 6375 2175
Text HLabel 6475 2525 2    50   Input ~ 0
MOSI
Wire Wire Line
	6475 2525 6375 2525
Connection ~ 6375 2525
Text HLabel 4425 1275 1    50   Input ~ 0
3.3V
Text HLabel 4425 1775 3    50   Input ~ 0
GND
$Comp
L Device:C C?
U 1 1 5EDA2F83
P 4425 1525
F 0 "C?" H 4540 1571 50  0000 L CNN
F 1 "C" H 4540 1480 50  0000 L CNN
F 2 "" H 4463 1375 50  0001 C CNN
F 3 "~" H 4425 1525 50  0001 C CNN
	1    4425 1525
	1    0    0    -1  
$EndComp
Wire Wire Line
	4425 1275 4425 1375
Wire Wire Line
	4425 1675 4425 1775
Text Notes 4450 825  0    150  ~ 0
Flash Memory
Text Notes 4825 1075 0    50   ~ 0
(Pull up on  COM LED)
Text Notes 5025 950  0    50   ~ 0
64 Mbit SPI
$EndSCHEMATC
