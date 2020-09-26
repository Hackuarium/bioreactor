EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Mechanical:MountingHole H1
U 1 1 5F5F0239
P 2300 3300
F 0 "H1" H 2400 3346 50  0000 L CNN
F 1 "MountingHole" H 2400 3255 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2300 3300 50  0001 C CNN
F 3 "~" H 2300 3300 50  0001 C CNN
	1    2300 3300
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5F5F05C4
P 3150 3300
F 0 "H3" H 3250 3346 50  0000 L CNN
F 1 "MountingHole" H 3250 3255 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 3150 3300 50  0001 C CNN
F 3 "~" H 3150 3300 50  0001 C CNN
	1    3150 3300
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5F5F0ED0
P 2300 3650
F 0 "H2" H 2400 3696 50  0000 L CNN
F 1 "MountingHole" H 2400 3605 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2300 3650 50  0001 C CNN
F 3 "~" H 2300 3650 50  0001 C CNN
	1    2300 3650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5F5F15BE
P 3150 3650
F 0 "H4" H 3250 3696 50  0000 L CNN
F 1 "MountingHole" H 3250 3605 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 3150 3650 50  0001 C CNN
F 3 "~" H 3150 3650 50  0001 C CNN
	1    3150 3650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J2
U 1 1 5F5F3B60
P 5500 3100
F 0 "J2" V 5562 3244 50  0000 L CNN
F 1 "Conn_01x04_Male" V 5653 3244 50  0000 L CNN
F 2 "" H 5500 3100 50  0001 C CNN
F 3 "~" H 5500 3100 50  0001 C CNN
	1    5500 3100
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x04_Male J3
U 1 1 5F5F4685
P 6250 3100
F 0 "J3" V 6312 3244 50  0000 L CNN
F 1 "Conn_01x04_Male" V 6403 3244 50  0000 L CNN
F 2 "" H 6250 3100 50  0001 C CNN
F 3 "~" H 6250 3100 50  0001 C CNN
	1    6250 3100
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x04_Male J4
U 1 1 5F5F4B92
P 7000 3100
F 0 "J4" V 7062 3244 50  0000 L CNN
F 1 "Conn_01x04_Male" V 7153 3244 50  0000 L CNN
F 2 "" H 7000 3100 50  0001 C CNN
F 3 "~" H 7000 3100 50  0001 C CNN
	1    7000 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	4500 3300 4500 3650
Wire Wire Line
	4500 3650 5300 3650
Wire Wire Line
	6800 3650 6800 3300
Wire Wire Line
	4600 3300 4600 3550
Wire Wire Line
	4600 3550 5400 3550
Wire Wire Line
	6900 3550 6900 3300
$Comp
L Connector:Conn_01x04_Male J1
U 1 1 5F5F226A
P 4700 3100
F 0 "J1" V 4762 3244 50  0000 L CNN
F 1 "Conn_01x04_Male" V 4853 3244 50  0000 L CNN
F 2 "" H 4700 3100 50  0001 C CNN
F 3 "~" H 4700 3100 50  0001 C CNN
	1    4700 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 3300 4700 3450
Wire Wire Line
	4700 3450 5500 3450
Wire Wire Line
	7000 3450 7000 3300
Wire Wire Line
	4800 3300 4800 3350
Wire Wire Line
	4800 3350 5600 3350
Wire Wire Line
	7100 3350 7100 3300
Wire Wire Line
	5300 3300 5300 3650
Connection ~ 5300 3650
Wire Wire Line
	5300 3650 6050 3650
Wire Wire Line
	5400 3300 5400 3550
Connection ~ 5400 3550
Wire Wire Line
	5400 3550 6150 3550
Wire Wire Line
	5500 3300 5500 3450
Connection ~ 5500 3450
Wire Wire Line
	5500 3450 6250 3450
Wire Wire Line
	5600 3300 5600 3350
Connection ~ 5600 3350
Wire Wire Line
	5600 3350 6350 3350
Wire Wire Line
	6050 3300 6050 3650
Connection ~ 6050 3650
Wire Wire Line
	6050 3650 6800 3650
Wire Wire Line
	6150 3300 6150 3550
Connection ~ 6150 3550
Wire Wire Line
	6150 3550 6900 3550
Wire Wire Line
	6250 3300 6250 3450
Connection ~ 6250 3450
Wire Wire Line
	6250 3450 7000 3450
Wire Wire Line
	6350 3300 6350 3350
Connection ~ 6350 3350
Wire Wire Line
	6350 3350 7100 3350
$EndSCHEMATC
