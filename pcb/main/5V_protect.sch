EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 17
Title "Bertha"
Date "2019-12-03"
Rev ""
Comp "Hackuarium"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Bertha_main-eagle-import:TINYISPT CON401
U 1 1 5E025B93
P 4950 3725
F 0 "CON401" H 4950 4111 59  0000 C CNN
F 1 "TINYISPT" H 4950 4006 59  0000 C CNN
F 2 "" H 4950 3725 50  0001 C CNN
F 3 "" H 4950 3725 50  0001 C CNN
	1    4950 3725
	1    0    0    -1  
$EndComp
Text GLabel 4575 3625 0    50   Input ~ 0
MISO
Text GLabel 4575 3725 0    50   Input ~ 0
SCK
Text GLabel 4575 3825 0    50   Input ~ 0
RESET
Wire Wire Line
	4575 3625 4650 3625
Wire Wire Line
	4650 3725 4575 3725
Wire Wire Line
	4575 3825 4650 3825
$Comp
L Bertha_main-eagle-import:1N581D1206 D401
U 1 1 5E026988
P 5650 3625
F 0 "D401" H 5575 3800 59  0000 C CNN
F 1 "1N581D1206" H 5600 3725 59  0000 C CNN
F 2 "" H 5650 3625 50  0001 C CNN
F 3 "" H 5650 3625 50  0001 C CNN
	1    5650 3625
	1    0    0    -1  
$EndComp
Text GLabel 5300 3725 2    50   Input ~ 0
MOSI
Text GLabel 5300 3825 2    50   Input ~ 0
GND
Wire Wire Line
	5300 3825 5250 3825
Wire Wire Line
	5300 3725 5250 3725
Wire Wire Line
	5250 3625 5550 3625
$Comp
L Bertha_main-eagle-import:1N581D1206 D403
U 1 1 5E02AEB7
P 6300 3825
F 0 "D403" H 6300 3589 59  0000 C CNN
F 1 "1N581D1206" H 6300 3694 59  0000 C CNN
F 2 "" H 6300 3825 50  0001 C CNN
F 3 "" H 6300 3825 50  0001 C CNN
	1    6300 3825
	-1   0    0    1   
$EndComp
Text GLabel 6000 3575 1    50   Input ~ 0
VDD
Wire Wire Line
	5750 3625 6000 3625
Wire Wire Line
	6000 3625 6000 3575
$Comp
L Bertha_main-eagle-import:1N581D1206 D402
U 1 1 5E02CABC
P 5875 4025
F 0 "D402" H 5875 3825 59  0000 C CNN
F 1 "1N581D1206" H 5875 3925 59  0000 C CNN
F 2 "" H 5875 4025 50  0001 C CNN
F 3 "" H 5875 4025 50  0001 C CNN
	1    5875 4025
	1    0    0    -1  
$EndComp
Wire Wire Line
	5975 4025 6000 4025
Wire Wire Line
	6000 4025 6000 3825
Connection ~ 6000 3625
Text GLabel 5675 4025 0    50   Input ~ 0
VUSB
Wire Wire Line
	5675 4025 5775 4025
Wire Wire Line
	6200 3825 6000 3825
Connection ~ 6000 3825
Wire Wire Line
	6000 3825 6000 3625
Text GLabel 6700 4200 0    50   Input ~ 0
GND
Wire Wire Line
	6700 4200 6775 4200
Wire Wire Line
	6750 3825 6875 3825
Connection ~ 6750 3825
Wire Wire Line
	6750 3750 6750 3825
Text GLabel 6750 3750 2    50   Input ~ 0
12V
Wire Wire Line
	6775 4125 6875 4125
Connection ~ 6775 4125
Wire Wire Line
	6775 4200 6775 4125
Wire Wire Line
	6650 4125 6775 4125
Connection ~ 6650 3825
Wire Wire Line
	6650 3825 6750 3825
Wire Wire Line
	6400 3825 6650 3825
$Comp
L Device:C C404
U 1 1 5E03487C
P 6875 3975
F 0 "C404" H 6990 4021 50  0000 L CNN
F 1 "100nF" H 6990 3930 50  0000 L CNN
F 2 "" H 6913 3825 50  0001 C CNN
F 3 "~" H 6875 3975 50  0001 C CNN
	1    6875 3975
	1    0    0    -1  
$EndComp
$Comp
L Device:C C402
U 1 1 5E0349F8
P 6650 3975
F 0 "C402" H 6350 4000 50  0000 L CNN
F 1 "10uF" H 6350 3925 50  0000 L CNN
F 2 "" H 6688 3825 50  0001 C CNN
F 3 "~" H 6650 3975 50  0001 C CNN
	1    6650 3975
	1    0    0    -1  
$EndComp
$Comp
L Device:C C401
U 1 1 5E044977
P 6450 3125
F 0 "C401" H 6175 3150 50  0000 L CNN
F 1 "10uF" H 6175 3075 50  0000 L CNN
F 2 "" H 6488 2975 50  0001 C CNN
F 3 "~" H 6450 3125 50  0001 C CNN
	1    6450 3125
	1    0    0    -1  
$EndComp
$Comp
L Device:C C403
U 1 1 5E045171
P 6675 3125
F 0 "C403" H 6790 3171 50  0000 L CNN
F 1 "100nF" H 6790 3080 50  0000 L CNN
F 2 "" H 6713 2975 50  0001 C CNN
F 3 "~" H 6675 3125 50  0001 C CNN
	1    6675 3125
	1    0    0    -1  
$EndComp
Text GLabel 6550 3350 0    50   Input ~ 0
GND
Wire Wire Line
	6450 3275 6550 3275
Wire Wire Line
	6550 3350 6550 3275
Connection ~ 6550 3275
Wire Wire Line
	6550 3275 6675 3275
Wire Wire Line
	6450 2975 6575 2975
Text GLabel 6575 2900 2    50   Input ~ 0
VDD
Wire Wire Line
	6575 2900 6575 2975
Connection ~ 6575 2975
Wire Wire Line
	6575 2975 6675 2975
Text Notes 7725 7025 0    315  ~ 0
5V_protect\n
$EndSCHEMATC
