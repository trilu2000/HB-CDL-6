EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "HM-Codelock"
Date "2020-10-19"
Rev "1.0"
Comp "no Company"
Comment1 "trilu"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L cc1101-module:CC1101 IC2
U 1 1 591050F9
P 6450 1800
F 0 "IC2" H 6450 2300 60  0000 C CNN
F 1 "CC1101" H 6450 1300 60  0000 C CNN
F 2 "CC1101_module:CC1101_Module" H 6450 1800 60  0001 C CNN
F 3 "" H 6450 1800 60  0000 C CNN
	1    6450 1800
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 591051B2
P 5650 2700
F 0 "SW2" H 5800 2800 50  0000 C CNN
F 1 "Config" H 6050 2800 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_FSMSM" H 5650 2700 50  0001 C CNN
F 3 "" H 5650 2700 50  0000 C CNN
	1    5650 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 59105482
P 1650 3750
F 0 "#PWR01" H 1650 3500 50  0001 C CNN
F 1 "GND" H 1650 3600 50  0000 C CNN
F 2 "" H 1650 3750 50  0000 C CNN
F 3 "" H 1650 3750 50  0000 C CNN
	1    1650 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 591054C6
P 7100 2100
F 0 "#PWR03" H 7100 1850 50  0001 C CNN
F 1 "GND" H 7100 1950 50  0000 C CNN
F 2 "" H 7100 2100 50  0000 C CNN
F 3 "" H 7100 2100 50  0000 C CNN
	1    7100 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 591054E8
P 1350 2100
F 0 "#PWR04" H 1350 1850 50  0001 C CNN
F 1 "GND" H 1350 1950 50  0000 C CNN
F 2 "" H 1350 2100 50  0000 C CNN
F 3 "" H 1350 2100 50  0000 C CNN
	1    1350 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5910567F
P 1350 1600
F 0 "C1" H 1375 1700 50  0000 L CNN
F 1 "100n" H 1375 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1388 1450 50  0001 C CNN
F 3 "" H 1350 1600 50  0000 C CNN
	1    1350 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 59105700
P 1750 2200
F 0 "C2" H 1775 2300 50  0000 L CNN
F 1 "100n" H 1775 2100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1788 2050 50  0001 C CNN
F 3 "" H 1750 2200 50  0000 C CNN
	1    1750 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5910572D
P 5350 1250
F 0 "C3" H 5375 1350 50  0000 L CNN
F 1 "100n" H 5375 1150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5388 1100 50  0001 C CNN
F 3 "" H 5350 1250 50  0000 C CNN
	1    5350 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 591057F4
P 4250 2600
F 0 "R1" V 4330 2600 50  0000 C CNN
F 1 "10k" V 4250 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4180 2600 50  0001 C CNN
F 3 "" H 4250 2600 50  0000 C CNN
	1    4250 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5910582F
P 5600 2950
F 0 "R2" V 5500 2950 50  0000 C CNN
F 1 "1k5" V 5600 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5530 2950 50  0001 C CNN
F 3 "" H 5600 2950 50  0000 C CNN
	1    5600 2950
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5910585E
P 5600 3150
F 0 "R3" V 5500 3150 50  0000 C CNN
F 1 "1k5" V 5600 3150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5530 3150 50  0001 C CNN
F 3 "" H 5600 3150 50  0000 C CNN
	1    5600 3150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5910646F
P 5350 1450
F 0 "#PWR05" H 5350 1200 50  0001 C CNN
F 1 "GND" H 5350 1300 50  0000 C CNN
F 2 "" H 5350 1450 50  0000 C CNN
F 3 "" H 5350 1450 50  0000 C CNN
	1    5350 1450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR06
U 1 1 5910649D
P 5350 850
F 0 "#PWR06" H 5350 700 50  0001 C CNN
F 1 "VCC" H 5350 1000 50  0000 C CNN
F 2 "" H 5350 850 50  0000 C CNN
F 3 "" H 5350 850 50  0000 C CNN
	1    5350 850 
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR07
U 1 1 591064CB
P 1350 1250
F 0 "#PWR07" H 1350 1100 50  0001 C CNN
F 1 "VCC" H 1350 1400 50  0000 C CNN
F 2 "" H 1350 1250 50  0000 C CNN
F 3 "" H 1350 1250 50  0000 C CNN
	1    1350 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 591064F9
P 1750 2500
F 0 "#PWR08" H 1750 2250 50  0001 C CNN
F 1 "GND" H 1750 2350 50  0000 C CNN
F 2 "" H 1750 2500 50  0000 C CNN
F 3 "" H 1750 2500 50  0000 C CNN
	1    1750 2500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 P1
U 1 1 591069AF
P 1300 4450
F 0 "P1" H 1300 4700 50  0000 C CNN
F 1 "Contacts" V 1400 4450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 1300 4450 50  0001 C CNN
F 3 "" H 1300 4450 50  0000 C CNN
	1    1300 4450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P3
U 1 1 59106C09
P 7450 1800
F 0 "P3" H 7450 1900 50  0000 C CNN
F 1 "ANT" V 7550 1800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 7450 1800 50  0001 C CNN
F 3 "" H 7450 1800 50  0000 C CNN
	1    7450 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal_Small Y1
U 1 1 59119102
P 2600 4500
F 0 "Y1" H 2600 4600 50  0000 C CNN
F 1 "32kHz" H 2600 4400 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_MicroCrystal_CC7V-T1A-2Pin_3.2x1.5mm_HandSoldering" H 2600 4500 50  0001 C CNN
F 3 "" H 2600 4500 50  0000 C CNN
	1    2600 4500
	0    1    1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 59119291
P 2300 4300
F 0 "C4" H 2325 4400 50  0000 L CNN
F 1 "9p" H 2325 4200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2338 4150 50  0001 C CNN
F 3 "" H 2300 4300 50  0000 C CNN
	1    2300 4300
	0    1    1    0   
$EndComp
$Comp
L Device:C C5
U 1 1 591192E4
P 2300 4700
F 0 "C5" H 2325 4800 50  0000 L CNN
F 1 "9p" H 2325 4600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2338 4550 50  0001 C CNN
F 3 "" H 2300 4700 50  0000 C CNN
	1    2300 4700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 59119369
P 1950 4500
F 0 "#PWR010" H 1950 4250 50  0001 C CNN
F 1 "GND" H 1950 4350 50  0000 C CNN
F 2 "" H 1950 4500 50  0000 C CNN
F 3 "" H 1950 4500 50  0000 C CNN
	1    1950 4500
	1    0    0    -1  
$EndComp
Text Label 3900 1650 0    60   ~ 0
MOSI
Text Label 3900 1750 0    60   ~ 0
MISO
Text Label 3900 1850 0    60   ~ 0
SCK
Wire Wire Line
	1100 4650 900  4650
Wire Wire Line
	7000 1650 7100 1650
Wire Wire Line
	7100 1650 7100 1950
Wire Wire Line
	7000 1950 7100 1950
Connection ~ 7100 1950
Wire Wire Line
	7250 1800 7000 1800
Wire Wire Line
	4250 2750 4250 2800
Wire Wire Line
	5950 1450 5750 1450
Wire Wire Line
	5750 1450 5750 1050
Wire Wire Line
	5750 1050 5350 1050
Connection ~ 5350 1050
Wire Wire Line
	3850 1650 5950 1650
Wire Wire Line
	5350 1100 5350 1050
Wire Wire Line
	5350 1450 5350 1400
Wire Wire Line
	5950 1550 5550 1550
Wire Wire Line
	5550 1550 5550 1450
Wire Wire Line
	5550 1450 5350 1450
Wire Wire Line
	5950 1750 4750 1750
Wire Wire Line
	4750 1750 4750 1850
Wire Wire Line
	4750 1850 3850 1850
Wire Wire Line
	5950 1850 4850 1850
Wire Wire Line
	4850 1850 4850 1950
Wire Wire Line
	4850 1950 4550 1950
Wire Wire Line
	4550 1950 4550 1750
Wire Wire Line
	4550 1750 3850 1750
Wire Wire Line
	5950 2150 4450 2150
Wire Wire Line
	4450 2150 4450 1550
Wire Wire Line
	4450 1550 3850 1550
Wire Wire Line
	1350 1250 1350 1350
Connection ~ 1350 1350
Wire Wire Line
	1350 1450 1750 1450
Wire Wire Line
	1350 1750 1350 2100
Wire Wire Line
	1750 2050 1750 1950
Connection ~ 1750 1450
Wire Wire Line
	1750 1650 1950 1650
Connection ~ 1750 1650
Wire Wire Line
	1950 1950 1750 1950
Connection ~ 1750 1950
Wire Wire Line
	1750 2350 1750 2500
Wire Wire Line
	1650 3450 1950 3450
Wire Wire Line
	1650 3450 1650 3550
Wire Wire Line
	1950 3550 1650 3550
Connection ~ 1650 3550
Wire Wire Line
	1950 3650 1650 3650
Connection ~ 1650 3650
Wire Wire Line
	3850 2300 4100 2300
Wire Wire Line
	2600 4400 2900 4400
Wire Wire Line
	2600 4600 2900 4600
Wire Wire Line
	2450 4300 2600 4300
Wire Wire Line
	2600 4300 2600 4400
Wire Wire Line
	2450 4700 2600 4700
Wire Wire Line
	2600 4700 2600 4600
Wire Wire Line
	2150 4700 2150 4500
Wire Wire Line
	1950 4500 2150 4500
Connection ~ 2150 4500
Text Label 3900 2800 0    60   ~ 0
RESET
Wire Wire Line
	3850 2950 4100 2950
Wire Wire Line
	3850 3050 4100 3050
Text Label 3900 2950 0    60   ~ 0
RXD
Text Label 3900 3050 0    60   ~ 0
TXD
Wire Wire Line
	3850 2400 4100 2400
Wire Wire Line
	3850 2200 4100 2200
Wire Wire Line
	1100 4350 900  4350
Wire Wire Line
	1100 4450 900  4450
Wire Wire Line
	1100 4550 900  4550
Text Label 3900 2200 0    60   ~ 0
A0
Text Label 3900 2300 0    60   ~ 0
A1
Text Label 3900 2400 0    60   ~ 0
A2
Text Label 900  4550 0    60   ~ 0
A0
Text Label 900  4650 0    60   ~ 0
A1
Text Label 900  4950 0    60   ~ 0
A2
Text Label 900  4450 0    60   ~ 0
GND
Wire Wire Line
	3850 2500 4100 2500
Wire Wire Line
	3850 2600 4100 2600
Wire Wire Line
	3850 2700 4100 2700
Text Label 3900 2500 0    60   ~ 0
A3
Text Label 3900 2600 0    60   ~ 0
A4
Text Label 3900 2700 0    60   ~ 0
A5
Wire Wire Line
	1100 4950 900  4950
Wire Wire Line
	1100 5050 900  5050
Wire Wire Line
	900  5150 1100 5150
Wire Wire Line
	1100 5250 900  5250
Text Label 900  5050 0    60   ~ 0
A3
Text Label 900  5150 0    60   ~ 0
A4
Text Label 900  5250 0    60   ~ 0
A5
Wire Wire Line
	3850 3250 4100 3250
Text Label 900  5350 0    60   ~ 0
D3
$Comp
L Connector_Generic:Conn_01x06 P2
U 1 1 59132195
P 1300 5150
F 0 "P2" H 1300 5500 50  0000 C CNN
F 1 "Contacts" V 1400 5150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 1300 5150 50  0001 C CNN
F 3 "" H 1300 5150 50  0000 C CNN
	1    1300 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 5350 900  5350
Wire Wire Line
	1100 5450 900  5450
Text Label 900  4350 0    60   ~ 0
VCC
Wire Wire Line
	3850 1950 4100 1950
Wire Wire Line
	3850 2050 4100 2050
Text Label 3900 1950 0    60   ~ 0
XTAL1
Text Label 3900 2050 0    60   ~ 0
XTAL2
Text Label 2900 4400 2    60   ~ 0
XTAL1
Text Label 2900 4600 2    60   ~ 0
XTAL2
Text Label 3900 3550 0    60   ~ 0
D6
Text Label 900  5450 0    60   ~ 0
D6
$Comp
L Device:C C6
U 1 1 59144E77
P 5750 6900
F 0 "C6" H 5775 7000 50  0000 L CNN
F 1 "10µ" H 5775 6800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5788 6750 50  0001 C CNN
F 3 "" H 5750 6900 50  0000 C CNN
	1    5750 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 59144F71
P 5750 7250
F 0 "#PWR011" H 5750 7000 50  0001 C CNN
F 1 "GND" H 5750 7100 50  0000 C CNN
F 2 "" H 5750 7250 50  0000 C CNN
F 3 "" H 5750 7250 50  0000 C CNN
	1    5750 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 1950 7100 2100
Wire Wire Line
	4250 2800 3850 2800
Wire Wire Line
	5350 1050 4250 1050
Wire Wire Line
	5350 1050 5350 850 
Wire Wire Line
	1350 1350 1350 1450
Wire Wire Line
	1350 1350 1950 1350
Wire Wire Line
	1750 1450 1950 1450
Wire Wire Line
	1750 1650 1750 1450
Wire Wire Line
	1750 1950 1750 1650
Wire Wire Line
	1650 3550 1650 3650
Wire Wire Line
	1650 3650 1650 3750
Wire Wire Line
	2150 4500 2150 4300
NoConn ~ 1950 2700
NoConn ~ 1950 2800
NoConn ~ 3850 3650
Text Label 3900 3250 0    60   ~ 0
D3
NoConn ~ 5950 1950
$Comp
L divers:ATMEGA328P-A IC1
U 1 1 591050B1
P 2850 2450
F 0 "IC1" H 2100 3700 50  0000 L BNN
F 1 "ATMEGA328P-A" H 3250 1050 50  0000 L BNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 2850 2450 50  0001 C CIN
F 3 "" H 2850 2450 50  0000 C CNN
	1    2850 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 1050 4250 2450
$Comp
L Device:LED D1
U 1 1 5F88BBEB
P 6050 2950
F 0 "D1" H 6200 2850 50  0000 C CNN
F 1 "LED" H 6050 2850 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6050 2950 50  0001 C CNN
F 3 "~" H 6050 2950 50  0001 C CNN
	1    6050 2950
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D2
U 1 1 5F88C538
P 6050 3150
F 0 "D2" H 6200 3050 50  0000 C CNN
F 1 "LED" H 6050 3050 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6050 3150 50  0001 C CNN
F 3 "~" H 6050 3150 50  0001 C CNN
	1    6050 3150
	-1   0    0    1   
$EndComp
$Comp
L LED:WS2812B D10
U 1 1 5F8A6A22
P 10550 5800
F 0 "D10" V 10300 5750 50  0000 R CNN
F 1 "WS2812B" V 10800 5750 50  0000 R CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 10600 5500 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 10650 5425 50  0001 L TNN
	1    10550 5800
	0    -1   1    0   
$EndComp
$Comp
L LED:WS2812B D9
U 1 1 5F8AB1E2
P 10550 5150
F 0 "D9" V 10300 5100 50  0000 R CNN
F 1 "WS2812B" V 10800 5100 50  0000 R CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 10600 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 10650 4775 50  0001 L TNN
	1    10550 5150
	0    -1   1    0   
$EndComp
$Comp
L LED:WS2812B D8
U 1 1 5F8AD128
P 10550 4500
F 0 "D8" V 10300 4450 50  0000 R CNN
F 1 "WS2812B" V 10800 4450 50  0000 R CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 10600 4200 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 10650 4125 50  0001 L TNN
	1    10550 4500
	0    -1   1    0   
$EndComp
$Comp
L LED:WS2812B D7
U 1 1 5F8AD8B4
P 10550 3850
F 0 "D7" V 10300 3800 50  0000 R CNN
F 1 "WS2812B" V 10800 3800 50  0000 R CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 10600 3550 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 10650 3475 50  0001 L TNN
	1    10550 3850
	0    -1   1    0   
$EndComp
$Comp
L LED:WS2812B D6
U 1 1 5F8AE014
P 10550 3200
F 0 "D6" V 10300 3150 50  0000 R CNN
F 1 "WS2812B" V 10800 3150 50  0000 R CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 10600 2900 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 10650 2825 50  0001 L TNN
	1    10550 3200
	0    -1   1    0   
$EndComp
$Comp
L LED:WS2812B D5
U 1 1 5F8AEB61
P 10550 2550
F 0 "D5" V 10300 2500 50  0000 R CNN
F 1 "WS2812B" V 10800 2500 50  0000 R CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 10600 2250 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 10650 2175 50  0001 L TNN
	1    10550 2550
	0    -1   1    0   
$EndComp
$Comp
L LED:WS2812B D4
U 1 1 5F8AF0A2
P 10550 1900
F 0 "D4" V 10300 1850 50  0000 R CNN
F 1 "WS2812B" V 10800 1850 50  0000 R CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 10600 1600 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 10650 1525 50  0001 L TNN
	1    10550 1900
	0    -1   1    0   
$EndComp
$Comp
L LED:WS2812B D3
U 1 1 5F8AF7B3
P 10550 1250
F 0 "D3" V 10300 1200 50  0000 R CNN
F 1 "WS2812B" V 10800 1200 50  0000 R CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 10600 950 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 10650 875 50  0001 L TNN
	1    10550 1250
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5F8B792A
P 11000 6150
F 0 "#PWR0101" H 11000 5900 50  0001 C CNN
F 1 "GND" H 11000 6000 50  0000 C CNN
F 2 "" H 11000 6150 50  0000 C CNN
F 3 "" H 11000 6150 50  0000 C CNN
	1    11000 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	11000 6150 11000 5800
Wire Wire Line
	11000 1250 10850 1250
Wire Wire Line
	10850 1900 11000 1900
Connection ~ 11000 1900
Wire Wire Line
	11000 1900 11000 1250
Wire Wire Line
	10850 2550 11000 2550
Connection ~ 11000 2550
Wire Wire Line
	11000 2550 11000 1900
Wire Wire Line
	10850 3200 11000 3200
Connection ~ 11000 3200
Wire Wire Line
	11000 3200 11000 2550
Wire Wire Line
	10850 3850 11000 3850
Connection ~ 11000 3850
Wire Wire Line
	11000 3850 11000 3200
Wire Wire Line
	10850 4500 11000 4500
Connection ~ 11000 4500
Wire Wire Line
	11000 4500 11000 3850
Wire Wire Line
	10850 5150 11000 5150
Connection ~ 11000 5150
Wire Wire Line
	11000 5150 11000 4500
Wire Wire Line
	10850 5800 11000 5800
Connection ~ 11000 5800
Wire Wire Line
	11000 5800 11000 5150
Wire Wire Line
	10100 5800 10100 5150
$Comp
L power:+5V #PWR0102
U 1 1 5F8DF1C4
P 10100 900
F 0 "#PWR0102" H 10100 750 50  0001 C CNN
F 1 "+5V" H 10100 1050 50  0000 C CNN
F 2 "" H 10100 900 50  0000 C CNN
F 3 "" H 10100 900 50  0000 C CNN
	1    10100 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 5800 10100 5800
Wire Wire Line
	10250 5150 10100 5150
Connection ~ 10100 5150
Wire Wire Line
	10100 5150 10100 4500
Wire Wire Line
	10250 4500 10100 4500
Connection ~ 10100 4500
Wire Wire Line
	10100 4500 10100 3850
Wire Wire Line
	10250 3850 10100 3850
Connection ~ 10100 3850
Wire Wire Line
	10100 3850 10100 3200
Wire Wire Line
	10250 3200 10100 3200
Connection ~ 10100 3200
Wire Wire Line
	10100 3200 10100 2550
Wire Wire Line
	10250 2550 10100 2550
Connection ~ 10100 2550
Wire Wire Line
	10100 2550 10100 1900
Wire Wire Line
	10250 1900 10100 1900
Connection ~ 10100 1900
Wire Wire Line
	10100 1900 10100 1250
Wire Wire Line
	10250 1250 10100 1250
Connection ~ 10100 1250
Wire Wire Line
	10100 1250 10100 900 
Wire Wire Line
	10550 1550 10550 1600
Wire Wire Line
	10550 2200 10550 2250
Wire Wire Line
	10550 2850 10550 2900
Wire Wire Line
	10550 3500 10550 3550
Wire Wire Line
	10550 4150 10550 4200
Wire Wire Line
	10550 4800 10550 4850
Wire Wire Line
	10550 5450 10550 5500
NoConn ~ 10550 6100
$Comp
L Connector_Generic:Conn_01x06 J2
U 1 1 5F973138
P 7150 5800
F 0 "J2" H 7150 6100 50  0000 C CNN
F 1 "Touch" V 7250 5800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.00mm" H 7150 5800 50  0001 C CNN
F 3 "" H 7150 5800 50  0000 C CNN
	1    7150 5800
	-1   0    0    -1  
$EndComp
Text Label 7450 5600 0    60   ~ 0
VCC
Text Label 7450 5700 0    50   ~ 0
A3
Text Label 7450 5800 0    50   ~ 0
A5
Text Label 7450 5900 0    50   ~ 0
A4
Text Label 7450 6000 0    50   ~ 0
ADD
Text Label 7450 6100 0    50   ~ 0
GND
Connection ~ 1350 1450
Connection ~ 2600 4400
Connection ~ 2600 4600
Connection ~ 5350 1450
$Comp
L Connector_Generic:Conn_01x06 J5
U 1 1 5D71B228
P 8000 5800
F 0 "J5" H 8000 6100 50  0000 C CNN
F 1 "FTDI" V 8100 5800 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 8000 5800 50  0001 C CNN
F 3 "~" H 8000 5800 50  0001 C CNN
	1    8000 5800
	-1   0    0    -1  
$EndComp
Text Label 8300 5600 0    50   ~ 0
DTR
Text Label 8300 5700 0    50   ~ 0
TXD
Text Label 8300 5800 0    50   ~ 0
RXD
$Comp
L power:VCC #PWR013
U 1 1 5D7F9186
P 5750 6300
F 0 "#PWR013" H 5750 6150 50  0001 C CNN
F 1 "VCC" H 5765 6473 50  0000 C CNN
F 2 "" H 5750 6300 50  0001 C CNN
F 3 "" H 5750 6300 50  0001 C CNN
	1    5750 6300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5D7FC14C
P 5050 7250
F 0 "#PWR0103" H 5050 7000 50  0001 C CNN
F 1 "GND" H 5055 7077 50  0000 C CNN
F 2 "" H 5050 7250 50  0001 C CNN
F 3 "" H 5050 7250 50  0001 C CNN
	1    5050 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C8
U 1 1 5D8005FA
P 5400 6900
F 0 "C8" H 5420 6990 50  0000 L CNN
F 1 "10µ" H 5430 6810 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 5438 6750 50  0001 C CNN
F 3 "~" H 5400 6900 50  0001 C CNN
	1    5400 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5D80B1FD
P 5400 7250
F 0 "#PWR09" H 5400 7000 50  0001 C CNN
F 1 "GND" H 5405 7077 50  0000 C CNN
F 2 "" H 5400 7250 50  0001 C CNN
F 3 "" H 5400 7250 50  0001 C CNN
	1    5400 7250
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:TLV1117-33 U2
U 1 1 5D7EFCA2
P 5050 6650
F 0 "U2" H 5050 6892 50  0000 C CNN
F 1 "TLV1117-33" H 5050 6801 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223" H 5050 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlv1117.pdf" H 5050 6650 50  0001 C CNN
	1    5050 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 5D837F96
P 4450 6300
F 0 "#PWR0106" H 4450 6150 50  0001 C CNN
F 1 "+5V" H 4465 6473 50  0000 C CNN
F 2 "" H 4450 6300 50  0001 C CNN
F 3 "" H 4450 6300 50  0001 C CNN
	1    4450 6300
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C7
U 1 1 5D842486
P 4450 6850
F 0 "C7" H 4470 6940 50  0000 L CNN
F 1 "10µ" H 4480 6760 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 4488 6700 50  0001 C CNN
F 3 "~" H 4450 6850 50  0001 C CNN
	1    4450 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5D846E33
P 4450 7250
F 0 "#PWR0107" H 4450 7000 50  0001 C CNN
F 1 "GND" H 4455 7077 50  0000 C CNN
F 2 "" H 4450 7250 50  0001 C CNN
F 3 "" H 4450 7250 50  0001 C CNN
	1    4450 7250
	1    0    0    -1  
$EndComp
Text Label 9100 5800 0    50   ~ 0
MOSI
Text Label 9100 6100 0    50   ~ 0
RESET
Text Label 9100 5900 0    50   ~ 0
SCK
$Comp
L power:GND #PWR025
U 1 1 5D89D425
P 8800 1900
F 0 "#PWR025" H 8800 1650 50  0001 C CNN
F 1 "GND" H 8805 1727 50  0000 C CNN
F 2 "" H 8800 1900 50  0001 C CNN
F 3 "" H 8800 1900 50  0001 C CNN
	1    8800 1900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR026
U 1 1 5D8B194B
P 8700 850
F 0 "#PWR026" H 8700 700 50  0001 C CNN
F 1 "+5V" H 8715 1023 50  0000 C CNN
F 2 "" H 8700 850 50  0001 C CNN
F 3 "" H 8700 850 50  0001 C CNN
	1    8700 850 
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR024
U 1 1 5D8B21C0
P 8900 850
F 0 "#PWR024" H 8900 700 50  0001 C CNN
F 1 "VCC" H 8915 1023 50  0000 C CNN
F 2 "" H 8900 850 50  0001 C CNN
F 3 "" H 8900 850 50  0001 C CNN
	1    8900 850 
	1    0    0    -1  
$EndComp
Text Label 9300 1400 0    60   ~ 0
D9
NoConn ~ 12200 800 
$Comp
L Connector_Generic:Conn_01x06 J6
U 1 1 5D8045CC
P 8800 5800
F 0 "J6" H 8800 6100 50  0000 C CNN
F 1 "ISP" V 8900 5800 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 8800 5800 50  0001 C CNN
F 3 "~" H 8800 5800 50  0001 C CNN
	1    8800 5800
	-1   0    0    -1  
$EndComp
Text Label 9100 6000 0    50   ~ 0
MISO
$Comp
L Logic_LevelTranslator:SN74LVC1T45DBV U3
U 1 1 5D89C7A4
P 8800 1400
F 0 "U3" H 9000 1900 50  0000 L CNN
F 1 "SN74LVC1T45DBV" H 8950 1800 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 8800 950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1t45.pdf" H 7900 750 50  0001 C CNN
	1    8800 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 1000 8900 850 
Wire Wire Line
	8700 1000 8700 850 
Text Label 8000 1400 0    60   ~ 0
LED_IN
Wire Wire Line
	8800 1800 8800 1850
Wire Wire Line
	8400 1600 8300 1600
Wire Wire Line
	8300 1600 8300 1850
Wire Wire Line
	8300 1850 8800 1850
Connection ~ 8800 1850
Wire Wire Line
	8800 1850 8800 1900
$Comp
L Device:Buzzer BZ1
U 1 1 6035B7F7
P 5700 3400
F 0 "BZ1" V 5800 3100 50  0000 L CNN
F 1 "Buzzer" V 5700 3000 50  0000 L CNN
F 2 "Buzzer_Beeper:Buzzer_CUI_CPT-9019S-SMT" V 5675 3500 50  0001 C CNN
F 3 "~" V 5675 3500 50  0001 C CNN
	1    5700 3400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 60366AD6
P 6450 3550
F 0 "#PWR0117" H 6450 3300 50  0001 C CNN
F 1 "GND" H 6455 3377 50  0000 C CNN
F 2 "" H 6450 3550 50  0001 C CNN
F 3 "" H 6450 3550 50  0001 C CNN
	1    6450 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 6650 5400 6650
Wire Wire Line
	5400 6750 5400 6650
Connection ~ 5400 6650
Wire Wire Line
	5400 7250 5400 7050
Wire Wire Line
	5050 7250 5050 6950
Wire Wire Line
	4750 6650 4450 6650
Wire Wire Line
	4450 6650 4450 6700
Connection ~ 4450 6650
$Comp
L Diode_Bridge:ABS2 D11
U 1 1 606EA078
P 2200 6400
F 0 "D11" H 2544 6446 50  0000 L CNN
F 1 "ABS2" H 2544 6355 50  0000 L CNN
F 2 "Diode_SMD:Diode_Bridge_Diotec_ABS" H 2350 6525 50  0001 L CNN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/abs2.pdf" H 2200 6400 50  0001 C CNN
	1    2200 6400
	1    0    0    -1  
$EndComp
$Comp
L divers:Wago-2060-452 J9
U 1 1 606F08A7
P 900 7250
F 0 "J9" H 1300 6885 50  0000 C CNN
F 1 "Wago-2060-452" H 1300 6976 50  0000 C CNN
F 2 "Divers:Wago-2060-452" H 1550 7350 50  0001 L CNN
F 3 "http://docs-emea.rs-online.com/webdocs/156b/0900766b8156b3f3.pdf" H 1550 7250 50  0001 L CNN
F 4 "WAGO - 2060-452/998-404 - TERMINAL BLOCK, WIRE TO BRD, 2POS, 18AWG" H 1550 7150 50  0001 L CNN "Description"
F 5 "Wago" H 1550 6950 50  0001 L CNN "Manufacturer_Name"
F 6 "2060-452/998-404" H 1550 6850 50  0001 L CNN "Manufacturer_Part_Number"
F 7 "2060-452/998-404" H 1550 6750 50  0001 L CNN "Arrow Part Number"
F 8 "https://www.arrow.com/en/products/2060-452998-404/wago-kontakttechnik-gmbh" H 1550 6650 50  0001 L CNN "Arrow Price/Stock"
	1    900  7250
	1    0    0    1   
$EndComp
Wire Wire Line
	1700 6600 1750 6600
Wire Wire Line
	1750 6600 1750 6100
Wire Wire Line
	1750 6100 2200 6100
Wire Wire Line
	1900 6400 1900 7250
Wire Wire Line
	2000 7150 1700 7150
NoConn ~ 900  6600
NoConn ~ 900  6700
NoConn ~ 900  7150
NoConn ~ 900  7250
Wire Wire Line
	7350 6100 7400 6100
Wire Wire Line
	7450 6000 7400 6000
Wire Wire Line
	7400 6000 7400 6100
Connection ~ 7400 6000
Wire Wire Line
	7400 6000 7350 6000
Connection ~ 7400 6100
Wire Wire Line
	7400 6100 7450 6100
Wire Wire Line
	7350 5900 7450 5900
Wire Wire Line
	7350 5800 7450 5800
Wire Wire Line
	7350 5700 7450 5700
Wire Wire Line
	7350 5600 7450 5600
NoConn ~ 7450 6000
Text Label 8300 6100 0    50   ~ 0
GND
Wire Wire Line
	8200 6100 8250 6100
Wire Wire Line
	8200 6000 8250 6000
Wire Wire Line
	8250 6000 8250 6100
Connection ~ 8250 6100
Wire Wire Line
	8250 6100 8300 6100
Text Label 8300 5900 0    60   ~ 0
VCC
Wire Wire Line
	8200 5900 8300 5900
Wire Wire Line
	8200 5800 8300 5800
Wire Wire Line
	8200 5700 8300 5700
Wire Wire Line
	8200 5600 8300 5600
Text Label 9100 5600 0    60   ~ 0
VCC
Text Label 9100 5700 0    50   ~ 0
GND
Wire Wire Line
	9000 5600 9100 5600
Wire Wire Line
	9000 5700 9100 5700
Wire Wire Line
	9000 5800 9100 5800
Wire Wire Line
	9000 5900 9100 5900
Wire Wire Line
	9000 6000 9100 6000
Wire Wire Line
	9000 6100 9100 6100
$Comp
L Device:C C11
U 1 1 5FD881F2
P 4550 2550
F 0 "C11" H 4575 2650 50  0000 L CNN
F 1 "100n" H 4575 2450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4588 2400 50  0001 C CNN
F 3 "" H 4550 2550 50  0000 C CNN
	1    4550 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2800 4550 2800
Wire Wire Line
	4550 2800 4550 2700
Connection ~ 4250 2800
Text Label 4650 2350 0    50   ~ 0
DTR
Wire Wire Line
	4550 2400 4550 2350
Wire Wire Line
	4550 2350 4650 2350
Wire Wire Line
	5850 2700 6450 2700
Wire Wire Line
	6450 2700 6450 2950
Wire Wire Line
	6200 2950 6450 2950
Connection ~ 6450 2950
Wire Wire Line
	6450 2950 6450 3150
Wire Wire Line
	6200 3150 6450 3150
Connection ~ 6450 3150
Wire Wire Line
	6450 3150 6450 3500
Wire Wire Line
	5800 3500 6450 3500
Connection ~ 6450 3500
Wire Wire Line
	6450 3500 6450 3550
Wire Wire Line
	5750 3150 5900 3150
Wire Wire Line
	5750 2950 5900 2950
Text Label 3900 3450 0    60   ~ 0
D5
Wire Wire Line
	4100 3550 3850 3550
NoConn ~ 3850 3350
Wire Wire Line
	4900 2050 4900 3150
Wire Wire Line
	4900 3150 3850 3150
Wire Wire Line
	4900 2050 5950 2050
Text Label 5250 2700 0    60   ~ 0
D8
Text Label 5250 2950 0    60   ~ 0
A0
Text Label 5250 3150 0    60   ~ 0
A1
Text Label 5250 3500 0    60   ~ 0
D5
Wire Wire Line
	5250 2700 5450 2700
Wire Wire Line
	5450 2950 5250 2950
Wire Wire Line
	5450 3150 5250 3150
Wire Wire Line
	5600 3500 5250 3500
Wire Wire Line
	4100 3450 3850 3450
Text Label 3900 1350 0    60   ~ 0
D8
Wire Wire Line
	4100 1350 3850 1350
Text Label 10600 850  0    60   ~ 0
LED_IN
Wire Wire Line
	10550 950  10550 850 
Wire Wire Line
	10550 850  10900 850 
Wire Wire Line
	8000 1400 8400 1400
Text Label 3900 1450 0    60   ~ 0
D9
Wire Wire Line
	4100 1450 3850 1450
Wire Wire Line
	9450 1400 9200 1400
Wire Wire Line
	4450 7000 4450 7250
Wire Wire Line
	5400 6650 5750 6650
Wire Wire Line
	5750 6750 5750 6650
Connection ~ 5750 6650
Wire Wire Line
	5750 7050 5750 7250
Wire Wire Line
	5750 6650 5750 6300
Wire Wire Line
	4450 6650 4450 6300
Wire Wire Line
	1700 6700 2200 6700
$Comp
L divers:Wago-2060-452 J8
U 1 1 606EDF36
P 900 6700
F 0 "J8" H 1300 6335 50  0000 C CNN
F 1 "Wago-2060-452" H 1300 6426 50  0000 C CNN
F 2 "Divers:Wago-2060-452" H 1550 6800 50  0001 L CNN
F 3 "http://docs-emea.rs-online.com/webdocs/156b/0900766b8156b3f3.pdf" H 1550 6700 50  0001 L CNN
F 4 "WAGO - 2060-452/998-404 - TERMINAL BLOCK, WIRE TO BRD, 2POS, 18AWG" H 1550 6600 50  0001 L CNN "Description"
F 5 "Wago" H 1550 6400 50  0001 L CNN "Manufacturer_Name"
F 6 "2060-452/998-404" H 1550 6300 50  0001 L CNN "Manufacturer_Part_Number"
F 7 "2060-452/998-404" H 1550 6200 50  0001 L CNN "Arrow Part Number"
F 8 "https://www.arrow.com/en/products/2060-452998-404/wago-kontakttechnik-gmbh" H 1550 6100 50  0001 L CNN "Arrow Price/Stock"
	1    900  6700
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 601A5C6F
P 8150 2350
F 0 "#PWR0104" H 8150 2200 50  0001 C CNN
F 1 "+5V" H 8150 2500 50  0000 C CNN
F 2 "" H 8150 2350 50  0000 C CNN
F 3 "" H 8150 2350 50  0000 C CNN
	1    8150 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 601A73E4
P 8150 2600
F 0 "C9" H 8175 2700 50  0000 L CNN
F 1 "100n" H 8175 2500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8188 2450 50  0001 C CNN
F 3 "" H 8150 2600 50  0000 C CNN
	1    8150 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 601A7963
P 8400 2600
F 0 "C10" H 8425 2700 50  0000 L CNN
F 1 "100n" H 8425 2500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8438 2450 50  0001 C CNN
F 3 "" H 8400 2600 50  0000 C CNN
	1    8400 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 601A7AF3
P 8650 2600
F 0 "C12" H 8675 2700 50  0000 L CNN
F 1 "100n" H 8675 2500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8688 2450 50  0001 C CNN
F 3 "" H 8650 2600 50  0000 C CNN
	1    8650 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 601A8416
P 8900 2600
F 0 "C14" H 8925 2700 50  0000 L CNN
F 1 "100n" H 8925 2500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8938 2450 50  0001 C CNN
F 3 "" H 8900 2600 50  0000 C CNN
	1    8900 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C16
U 1 1 601A8A25
P 9150 2600
F 0 "C16" H 9175 2700 50  0000 L CNN
F 1 "100n" H 9175 2500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9188 2450 50  0001 C CNN
F 3 "" H 9150 2600 50  0000 C CNN
	1    9150 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C17
U 1 1 601A8CBD
P 9400 2600
F 0 "C17" H 9425 2700 50  0000 L CNN
F 1 "100n" H 9425 2500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9438 2450 50  0001 C CNN
F 3 "" H 9400 2600 50  0000 C CNN
	1    9400 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 601A8EA3
P 9400 2850
F 0 "#PWR0105" H 9400 2600 50  0001 C CNN
F 1 "GND" H 9400 2700 50  0000 C CNN
F 2 "" H 9400 2850 50  0000 C CNN
F 3 "" H 9400 2850 50  0000 C CNN
	1    9400 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2350 8150 2450
Wire Wire Line
	8150 2450 8400 2450
Connection ~ 8150 2450
Connection ~ 8400 2450
Wire Wire Line
	8400 2450 8650 2450
Connection ~ 8650 2450
Connection ~ 8900 2450
Wire Wire Line
	8150 2750 8400 2750
Connection ~ 8400 2750
Wire Wire Line
	8400 2750 8650 2750
Connection ~ 8650 2750
Connection ~ 8900 2750
Connection ~ 9400 2750
Wire Wire Line
	8900 2450 9150 2450
Wire Wire Line
	8900 2750 9150 2750
Connection ~ 9150 2450
Wire Wire Line
	9150 2450 9400 2450
Connection ~ 9150 2750
Wire Wire Line
	9150 2750 9400 2750
Wire Wire Line
	9400 2850 9400 2750
Wire Wire Line
	8650 2450 8900 2450
Wire Wire Line
	8650 2750 8900 2750
$Comp
L divers:DCDC_MICRO_MP2315 U1
U 1 1 5F89CC12
P 3250 6850
F 0 "U1" H 3275 7115 50  0000 C CNN
F 1 "DCDC_MICRO_MP2315" H 3275 7024 50  0000 C CNN
F 2 "Divers:PIN_DCDC_MICRO_MP2315" H 3250 6850 50  0001 C CNN
F 3 "" H 3250 6850 50  0001 C CNN
	1    3250 6850
	1    0    0    -1  
$EndComp
Connection ~ 1900 7250
Wire Wire Line
	3250 7250 3250 7200
Wire Wire Line
	2000 6850 2000 7150
Wire Wire Line
	2500 6400 2500 6850
Connection ~ 2500 6850
$Comp
L power:+5V #PWR0108
U 1 1 5F8DD7D1
P 3700 6300
F 0 "#PWR0108" H 3700 6150 50  0001 C CNN
F 1 "+5V" H 3715 6473 50  0000 C CNN
F 2 "" H 3700 6300 50  0001 C CNN
F 3 "" H 3700 6300 50  0001 C CNN
	1    3700 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 6850 3700 6850
Wire Wire Line
	3700 6850 3700 6300
Wire Wire Line
	1900 7250 3250 7250
Wire Wire Line
	2500 6850 2900 6850
Wire Wire Line
	1700 7250 1900 7250
Wire Wire Line
	2000 6850 2500 6850
$Comp
L power:GND #PWR0109
U 1 1 5F9FD19F
P 3700 7300
F 0 "#PWR0109" H 3700 7050 50  0001 C CNN
F 1 "GND" H 3705 7127 50  0000 C CNN
F 2 "" H 3700 7300 50  0001 C CNN
F 3 "" H 3700 7300 50  0001 C CNN
	1    3700 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 7250 3700 7250
Wire Wire Line
	3700 7250 3700 7300
Connection ~ 3250 7250
$EndSCHEMATC
