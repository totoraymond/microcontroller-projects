EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:custom
LIBS:line_follower-cache
EELAYER 25 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "Line Follower Robot"
Date "2017-03-03"
Rev "1"
Comp "DigitalCave"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L SDXM-U11-1_BOARD U1
U 1 1 58929891
P 3200 6900
F 0 "U1" H 3500 6900 60  0000 C CNN
F 1 "BOOST" H 3200 6800 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 3200 6900 60  0001 C CNN
F 3 "" H 3200 6900 60  0000 C CNN
	1    3200 6900
	0    1    1    0   
$EndComp
$Comp
L GND #PWR01
U 1 1 58929AA6
P 4100 6900
F 0 "#PWR01" H 4100 6650 50  0001 C CNN
F 1 "GND" H 4100 6750 50  0000 C CNN
F 2 "" H 4100 6900 50  0000 C CNN
F 3 "" H 4100 6900 50  0000 C CNN
	1    4100 6900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3650 6900 4100 6900
Wire Wire Line
	3650 6800 3750 6800
Wire Wire Line
	3750 6800 3750 6700
$Comp
L +BATT #PWR02
U 1 1 58929B3E
P 3750 6700
F 0 "#PWR02" H 3750 6550 50  0001 C CNN
F 1 "+BATT" H 3750 6840 50  0000 C CNN
F 2 "" H 3750 6700 50  0000 C CNN
F 3 "" H 3750 6700 50  0000 C CNN
	1    3750 6700
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR03
U 1 1 58929C00
P 3750 7300
F 0 "#PWR03" H 3750 7150 50  0001 C CNN
F 1 "+5V" H 3750 7440 50  0000 C CNN
F 2 "" H 3750 7300 50  0000 C CNN
F 3 "" H 3750 7300 50  0000 C CNN
	1    3750 7300
	-1   0    0    1   
$EndComp
Wire Wire Line
	3650 7000 3750 7000
Wire Wire Line
	3750 7000 3750 7300
$Comp
L L293D U3
U 1 1 58BA0782
P 8100 4950
F 0 "U3" H 8200 4750 60  0000 C CNN
F 1 "L293D" H 8200 5150 60  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm" H 8150 4700 60  0001 C CNN
F 3 "" H 8150 4700 60  0000 C CNN
	1    8100 4950
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P4
U 1 1 58BA0827
P 8950 4750
F 0 "P4" H 8950 4900 50  0000 C CNN
F 1 "MOTOR_L" V 9050 4750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 8950 4750 50  0001 C CNN
F 3 "" H 8950 4750 50  0000 C CNN
	1    8950 4750
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P5
U 1 1 58BA0A52
P 8950 5150
F 0 "P5" H 8950 5300 50  0000 C CNN
F 1 "MOTOR_R" V 9050 5150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 8950 5150 50  0001 C CNN
F 3 "" H 8950 5150 50  0000 C CNN
	1    8950 5150
	1    0    0    -1  
$EndComp
$Comp
L Led_Small D1
U 1 1 58BA0FE8
P 1800 6250
F 0 "D1" H 1750 6375 50  0000 L CNN
F 1 "IR_LED" H 1625 6150 50  0000 L CNN
F 2 "LEDs:LED-5MM" V 1800 6250 50  0001 C CNN
F 3 "" V 1800 6250 50  0000 C CNN
	1    1800 6250
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR04
U 1 1 58BA11BD
P 1200 6250
F 0 "#PWR04" H 1200 6100 50  0001 C CNN
F 1 "+5V" H 1200 6390 50  0000 C CNN
F 2 "" H 1200 6250 50  0000 C CNN
F 3 "" H 1200 6250 50  0000 C CNN
	1    1200 6250
	0    -1   -1   0   
$EndComp
$Comp
L RSMALL R1
U 1 1 58BA11D6
P 1450 6250
F 0 "R1" V 1540 6245 40  0000 C CNN
F 1 "220" V 1365 6250 40  0000 C CNN
F 2 "Discret:R1" V 1380 6250 30  0001 C CNN
F 3 "" H 1450 6300 30  0000 C CNN
	1    1450 6250
	0    1    1    0   
$EndComp
$Comp
L GND #PWR05
U 1 1 58BA1478
P 2050 6250
F 0 "#PWR05" H 2050 6000 50  0001 C CNN
F 1 "GND" H 2050 6100 50  0000 C CNN
F 2 "" H 2050 6250 50  0000 C CNN
F 3 "" H 2050 6250 50  0000 C CNN
	1    2050 6250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1200 6250 1350 6250
Wire Wire Line
	1550 6250 1700 6250
Wire Wire Line
	1900 6250 2050 6250
$Comp
L Led_Small D2
U 1 1 58BA1660
P 1800 6550
F 0 "D2" H 1750 6675 50  0000 L CNN
F 1 "IR_LED" H 1625 6450 50  0000 L CNN
F 2 "LEDs:LED-5MM" V 1800 6550 50  0001 C CNN
F 3 "" V 1800 6550 50  0000 C CNN
	1    1800 6550
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR06
U 1 1 58BA1666
P 1200 6550
F 0 "#PWR06" H 1200 6400 50  0001 C CNN
F 1 "+5V" H 1200 6690 50  0000 C CNN
F 2 "" H 1200 6550 50  0000 C CNN
F 3 "" H 1200 6550 50  0000 C CNN
	1    1200 6550
	0    -1   -1   0   
$EndComp
$Comp
L RSMALL R2
U 1 1 58BA166C
P 1450 6550
F 0 "R2" V 1540 6545 40  0000 C CNN
F 1 "220" V 1365 6550 40  0000 C CNN
F 2 "Discret:R1" V 1380 6550 30  0001 C CNN
F 3 "" H 1450 6600 30  0000 C CNN
	1    1450 6550
	0    1    1    0   
$EndComp
$Comp
L GND #PWR07
U 1 1 58BA1672
P 2050 6550
F 0 "#PWR07" H 2050 6300 50  0001 C CNN
F 1 "GND" H 2050 6400 50  0000 C CNN
F 2 "" H 2050 6550 50  0000 C CNN
F 3 "" H 2050 6550 50  0000 C CNN
	1    2050 6550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1200 6550 1350 6550
Wire Wire Line
	1550 6550 1700 6550
Wire Wire Line
	1900 6550 2050 6550
$Comp
L Led_Small D3
U 1 1 58BA17FF
P 1800 6850
F 0 "D3" H 1750 6975 50  0000 L CNN
F 1 "IR_LED" H 1625 6750 50  0000 L CNN
F 2 "LEDs:LED-5MM" V 1800 6850 50  0001 C CNN
F 3 "" V 1800 6850 50  0000 C CNN
	1    1800 6850
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR08
U 1 1 58BA1805
P 1200 6850
F 0 "#PWR08" H 1200 6700 50  0001 C CNN
F 1 "+5V" H 1200 6990 50  0000 C CNN
F 2 "" H 1200 6850 50  0000 C CNN
F 3 "" H 1200 6850 50  0000 C CNN
	1    1200 6850
	0    -1   -1   0   
$EndComp
$Comp
L RSMALL R3
U 1 1 58BA180B
P 1450 6850
F 0 "R3" V 1540 6845 40  0000 C CNN
F 1 "220" V 1365 6850 40  0000 C CNN
F 2 "Discret:R1" V 1380 6850 30  0001 C CNN
F 3 "" H 1450 6900 30  0000 C CNN
	1    1450 6850
	0    1    1    0   
$EndComp
$Comp
L GND #PWR09
U 1 1 58BA1811
P 2050 6850
F 0 "#PWR09" H 2050 6600 50  0001 C CNN
F 1 "GND" H 2050 6700 50  0000 C CNN
F 2 "" H 2050 6850 50  0000 C CNN
F 3 "" H 2050 6850 50  0000 C CNN
	1    2050 6850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1200 6850 1350 6850
Wire Wire Line
	1550 6850 1700 6850
Wire Wire Line
	1900 6850 2050 6850
$Comp
L Led_Small D4
U 1 1 58BA181A
P 1800 7150
F 0 "D4" H 1750 7275 50  0000 L CNN
F 1 "IR_LED" H 1625 7050 50  0000 L CNN
F 2 "LEDs:LED-5MM" V 1800 7150 50  0001 C CNN
F 3 "" V 1800 7150 50  0000 C CNN
	1    1800 7150
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR010
U 1 1 58BA1820
P 1200 7150
F 0 "#PWR010" H 1200 7000 50  0001 C CNN
F 1 "+5V" H 1200 7290 50  0000 C CNN
F 2 "" H 1200 7150 50  0000 C CNN
F 3 "" H 1200 7150 50  0000 C CNN
	1    1200 7150
	0    -1   -1   0   
$EndComp
$Comp
L RSMALL R4
U 1 1 58BA1826
P 1450 7150
F 0 "R4" V 1540 7145 40  0000 C CNN
F 1 "220" V 1365 7150 40  0000 C CNN
F 2 "Discret:R1" V 1380 7150 30  0001 C CNN
F 3 "" H 1450 7200 30  0000 C CNN
	1    1450 7150
	0    1    1    0   
$EndComp
$Comp
L GND #PWR011
U 1 1 58BA182C
P 2050 7150
F 0 "#PWR011" H 2050 6900 50  0001 C CNN
F 1 "GND" H 2050 7000 50  0000 C CNN
F 2 "" H 2050 7150 50  0000 C CNN
F 3 "" H 2050 7150 50  0000 C CNN
	1    2050 7150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1200 7150 1350 7150
Wire Wire Line
	1550 7150 1700 7150
Wire Wire Line
	1900 7150 2050 7150
$Comp
L Led_Small D5
U 1 1 58BA18C1
P 1800 7450
F 0 "D5" H 1750 7575 50  0000 L CNN
F 1 "IR_LED" H 1625 7350 50  0000 L CNN
F 2 "LEDs:LED-5MM" V 1800 7450 50  0001 C CNN
F 3 "" V 1800 7450 50  0000 C CNN
	1    1800 7450
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR012
U 1 1 58BA18C7
P 1200 7450
F 0 "#PWR012" H 1200 7300 50  0001 C CNN
F 1 "+5V" H 1200 7590 50  0000 C CNN
F 2 "" H 1200 7450 50  0000 C CNN
F 3 "" H 1200 7450 50  0000 C CNN
	1    1200 7450
	0    -1   -1   0   
$EndComp
$Comp
L RSMALL R5
U 1 1 58BA18CD
P 1450 7450
F 0 "R5" V 1540 7445 40  0000 C CNN
F 1 "220" V 1365 7450 40  0000 C CNN
F 2 "Discret:R1" V 1380 7450 30  0001 C CNN
F 3 "" H 1450 7500 30  0000 C CNN
	1    1450 7450
	0    1    1    0   
$EndComp
$Comp
L GND #PWR013
U 1 1 58BA18D3
P 2050 7450
F 0 "#PWR013" H 2050 7200 50  0001 C CNN
F 1 "GND" H 2050 7300 50  0000 C CNN
F 2 "" H 2050 7450 50  0000 C CNN
F 3 "" H 2050 7450 50  0000 C CNN
	1    2050 7450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1200 7450 1350 7450
Wire Wire Line
	1550 7450 1700 7450
Wire Wire Line
	1900 7450 2050 7450
Text Notes 1200 6050 0    60   ~ 0
LED IR Illuminators
Text Notes 3100 6300 0    60   ~ 0
Boost Regulator
Wire Wire Line
	8650 4650 8700 4650
Wire Wire Line
	8700 4650 8700 4700
Wire Wire Line
	8700 4700 8750 4700
Wire Wire Line
	8650 4850 8700 4850
Wire Wire Line
	8700 4850 8700 4800
Wire Wire Line
	8700 4800 8750 4800
Wire Wire Line
	8650 5050 8700 5050
Wire Wire Line
	8700 5050 8700 5100
Wire Wire Line
	8700 5100 8750 5100
Wire Wire Line
	8650 5250 8700 5250
Wire Wire Line
	8700 5250 8700 5200
Wire Wire Line
	8700 5200 8750 5200
Wire Wire Line
	7950 5800 7950 5900
Wire Wire Line
	7950 5900 8250 5900
Wire Wire Line
	8250 5800 8250 6000
Wire Wire Line
	8150 5800 8150 5900
Connection ~ 8150 5900
Wire Wire Line
	8050 5800 8050 5900
Connection ~ 8050 5900
Connection ~ 8250 5900
$Comp
L GND #PWR014
U 1 1 58BA215E
P 8250 6000
F 0 "#PWR014" H 8250 5750 50  0001 C CNN
F 1 "GND" H 8250 5850 50  0000 C CNN
F 2 "" H 8250 6000 50  0000 C CNN
F 3 "" H 8250 6000 50  0000 C CNN
	1    8250 6000
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR015
U 1 1 58BA2FB6
P 7950 3950
F 0 "#PWR015" H 7950 3800 50  0001 C CNN
F 1 "+5V" H 7950 4090 50  0000 C CNN
F 2 "" H 7950 3950 50  0000 C CNN
F 3 "" H 7950 3950 50  0000 C CNN
	1    7950 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 3950 7950 4050
$Comp
L +BATT #PWR016
U 1 1 58BA311E
P 8250 3950
F 0 "#PWR016" H 8250 3800 50  0001 C CNN
F 1 "+BATT" H 8250 4090 50  0000 C CNN
F 2 "" H 8250 3950 50  0000 C CNN
F 3 "" H 8250 3950 50  0000 C CNN
	1    8250 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3950 8250 4050
$Comp
L +5V #PWR017
U 1 1 58BA4613
P 5700 1700
F 0 "#PWR017" H 5700 1550 50  0001 C CNN
F 1 "+5V" H 5700 1840 50  0000 C CNN
F 2 "" H 5700 1700 50  0000 C CNN
F 3 "" H 5700 1700 50  0000 C CNN
	1    5700 1700
	0    1    1    0   
$EndComp
$Comp
L ARDUINO_PRO_MICRO U2
U 1 1 58BA5682
P 4950 2150
F 0 "U2" H 4750 2900 60  0000 C CNN
F 1 "ARDUINO_PRO_MICRO" V 4950 2350 60  0000 C CNN
F 2 "Housings_DIP:DIP-24_W15.24mm_LongPads" H 4950 2350 60  0001 C CNN
F 3 "" H 4950 2350 60  0000 C CNN
	1    4950 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 1700 5600 1700
$Comp
L GND #PWR018
U 1 1 58BA5C90
P 5700 1500
F 0 "#PWR018" H 5700 1250 50  0001 C CNN
F 1 "GND" H 5700 1350 50  0000 C CNN
F 2 "" H 5700 1500 50  0000 C CNN
F 3 "" H 5700 1500 50  0000 C CNN
	1    5700 1500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5700 1500 5600 1500
$Comp
L CONN_01X01 P2
U 1 1 58BA5CF7
P 6100 1600
F 0 "P2" H 6100 1700 50  0000 C CNN
F 1 "RST" V 6200 1600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01" H 6100 1600 50  0001 C CNN
F 3 "" H 6100 1600 50  0000 C CNN
	1    6100 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 1600 5600 1600
$Comp
L PHOTO_TRANSISTOR_NPN Q1
U 1 1 58BA6831
P 2250 3800
F 0 "Q1" V 2200 3650 39  0000 C CNN
F 1 "PHOTO_TRANSISTOR" V 2400 3800 39  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_2x01" H 2250 3800 60  0001 C CNN
F 3 "" H 2250 3800 60  0001 C CNN
	1    2250 3800
	0    1    1    0   
$EndComp
$Comp
L RSMALL R7
U 1 1 58BA721C
P 2600 3850
F 0 "R7" V 2650 3900 40  0000 C CNN
F 1 "10k" V 2650 3800 40  0000 C CNN
F 2 "Discret:R1" V 2530 3850 30  0001 C CNN
F 3 "" H 2600 3900 30  0000 C CNN
	1    2600 3850
	0    1    1    0   
$EndComp
$Comp
L GND #PWR019
U 1 1 58BA78B7
P 2000 3850
F 0 "#PWR019" H 2000 3600 50  0001 C CNN
F 1 "GND" H 2000 3700 50  0000 C CNN
F 2 "" H 2000 3850 50  0000 C CNN
F 3 "" H 2000 3850 50  0000 C CNN
	1    2000 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	2100 3850 2000 3850
Wire Wire Line
	2400 3850 2500 3850
$Comp
L +5V #PWR020
U 1 1 58BA7990
P 2800 3850
F 0 "#PWR020" H 2800 3700 50  0001 C CNN
F 1 "+5V" H 2800 3990 50  0000 C CNN
F 2 "" H 2800 3850 50  0000 C CNN
F 3 "" H 2800 3850 50  0000 C CNN
	1    2800 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 3850 2700 3850
Connection ~ 2450 3850
Wire Wire Line
	2450 3750 2450 3850
$Comp
L PHOTO_TRANSISTOR_NPN Q2
U 1 1 58BA88E0
P 2250 4100
F 0 "Q2" V 2200 3950 39  0000 C CNN
F 1 "PHOTO_TRANSISTOR" V 2400 4100 39  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_2x01" H 2250 4100 60  0001 C CNN
F 3 "" H 2250 4100 60  0001 C CNN
	1    2250 4100
	0    1    1    0   
$EndComp
$Comp
L RSMALL R8
U 1 1 58BA88E6
P 2600 4150
F 0 "R8" V 2650 4200 40  0000 C CNN
F 1 "10k" V 2650 4100 40  0000 C CNN
F 2 "Discret:R1" V 2530 4150 30  0001 C CNN
F 3 "" H 2600 4200 30  0000 C CNN
	1    2600 4150
	0    1    1    0   
$EndComp
$Comp
L GND #PWR021
U 1 1 58BA88EC
P 2000 4150
F 0 "#PWR021" H 2000 3900 50  0001 C CNN
F 1 "GND" H 2000 4000 50  0000 C CNN
F 2 "" H 2000 4150 50  0000 C CNN
F 3 "" H 2000 4150 50  0000 C CNN
	1    2000 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	2100 4150 2000 4150
Wire Wire Line
	2400 4150 2500 4150
$Comp
L +5V #PWR022
U 1 1 58BA88F4
P 2800 4150
F 0 "#PWR022" H 2800 4000 50  0001 C CNN
F 1 "+5V" H 2800 4290 50  0000 C CNN
F 2 "" H 2800 4150 50  0000 C CNN
F 3 "" H 2800 4150 50  0000 C CNN
	1    2800 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 4150 2700 4150
Connection ~ 2450 4150
Wire Wire Line
	2450 4050 2450 4150
$Comp
L PHOTO_TRANSISTOR_NPN Q3
U 1 1 58BA89DE
P 2250 4400
F 0 "Q3" V 2200 4250 39  0000 C CNN
F 1 "PHOTO_TRANSISTOR" V 2400 4400 39  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_2x01" H 2250 4400 60  0001 C CNN
F 3 "" H 2250 4400 60  0001 C CNN
	1    2250 4400
	0    1    1    0   
$EndComp
$Comp
L RSMALL R9
U 1 1 58BA89E4
P 2600 4450
F 0 "R9" V 2650 4500 40  0000 C CNN
F 1 "10k" V 2650 4400 40  0000 C CNN
F 2 "Discret:R1" V 2530 4450 30  0001 C CNN
F 3 "" H 2600 4500 30  0000 C CNN
	1    2600 4450
	0    1    1    0   
$EndComp
$Comp
L GND #PWR023
U 1 1 58BA89EA
P 2000 4450
F 0 "#PWR023" H 2000 4200 50  0001 C CNN
F 1 "GND" H 2000 4300 50  0000 C CNN
F 2 "" H 2000 4450 50  0000 C CNN
F 3 "" H 2000 4450 50  0000 C CNN
	1    2000 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	2100 4450 2000 4450
Wire Wire Line
	2400 4450 2500 4450
$Comp
L +5V #PWR024
U 1 1 58BA89F2
P 2800 4450
F 0 "#PWR024" H 2800 4300 50  0001 C CNN
F 1 "+5V" H 2800 4590 50  0000 C CNN
F 2 "" H 2800 4450 50  0000 C CNN
F 3 "" H 2800 4450 50  0000 C CNN
	1    2800 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 4450 2700 4450
Connection ~ 2450 4450
Wire Wire Line
	2450 4350 2450 4450
$Comp
L PHOTO_TRANSISTOR_NPN Q4
U 1 1 58BA89FC
P 2250 4700
F 0 "Q4" V 2200 4550 39  0000 C CNN
F 1 "PHOTO_TRANSISTOR" V 2400 4700 39  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_2x01" H 2250 4700 60  0001 C CNN
F 3 "" H 2250 4700 60  0001 C CNN
	1    2250 4700
	0    1    1    0   
$EndComp
$Comp
L RSMALL R10
U 1 1 58BA8A02
P 2600 4750
F 0 "R10" V 2650 4800 40  0000 C CNN
F 1 "10k" V 2650 4700 40  0000 C CNN
F 2 "Discret:R1" V 2530 4750 30  0001 C CNN
F 3 "" H 2600 4800 30  0000 C CNN
	1    2600 4750
	0    1    1    0   
$EndComp
$Comp
L GND #PWR025
U 1 1 58BA8A08
P 2000 4750
F 0 "#PWR025" H 2000 4500 50  0001 C CNN
F 1 "GND" H 2000 4600 50  0000 C CNN
F 2 "" H 2000 4750 50  0000 C CNN
F 3 "" H 2000 4750 50  0000 C CNN
	1    2000 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	2100 4750 2000 4750
Wire Wire Line
	2400 4750 2500 4750
$Comp
L +5V #PWR026
U 1 1 58BA8A10
P 2800 4750
F 0 "#PWR026" H 2800 4600 50  0001 C CNN
F 1 "+5V" H 2800 4890 50  0000 C CNN
F 2 "" H 2800 4750 50  0000 C CNN
F 3 "" H 2800 4750 50  0000 C CNN
	1    2800 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 4750 2700 4750
Connection ~ 2450 4750
Wire Wire Line
	2450 4650 2450 4750
$Comp
L PHOTO_TRANSISTOR_NPN Q5
U 1 1 58BA8AA2
P 2250 5000
F 0 "Q5" V 2200 4850 39  0000 C CNN
F 1 "PHOTO_TRANSISTOR" V 2400 5000 39  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_2x01" H 2250 5000 60  0001 C CNN
F 3 "" H 2250 5000 60  0001 C CNN
	1    2250 5000
	0    1    1    0   
$EndComp
$Comp
L RSMALL R6
U 1 1 58BA8AA8
P 2600 5050
F 0 "R6" V 2650 5100 40  0000 C CNN
F 1 "10k" V 2650 5000 40  0000 C CNN
F 2 "Discret:R1" V 2530 5050 30  0001 C CNN
F 3 "" H 2600 5100 30  0000 C CNN
	1    2600 5050
	0    1    1    0   
$EndComp
$Comp
L GND #PWR027
U 1 1 58BA8AAE
P 2000 5050
F 0 "#PWR027" H 2000 4800 50  0001 C CNN
F 1 "GND" H 2000 4900 50  0000 C CNN
F 2 "" H 2000 5050 50  0000 C CNN
F 3 "" H 2000 5050 50  0000 C CNN
	1    2000 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	2100 5050 2000 5050
Wire Wire Line
	2400 5050 2500 5050
$Comp
L +5V #PWR028
U 1 1 58BA8AB6
P 2800 5050
F 0 "#PWR028" H 2800 4900 50  0001 C CNN
F 1 "+5V" H 2800 5190 50  0000 C CNN
F 2 "" H 2800 5050 50  0000 C CNN
F 3 "" H 2800 5050 50  0000 C CNN
	1    2800 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 5050 2700 5050
Connection ~ 2450 5050
Text Notes 2000 3300 0    60   ~ 0
IR Photo Sensors
Wire Wire Line
	5600 2100 6050 2100
Wire Wire Line
	6050 2100 6050 4950
Wire Wire Line
	5600 2000 6150 2000
Wire Wire Line
	6150 2000 6150 4050
Wire Wire Line
	6150 4050 2450 4050
Wire Wire Line
	5600 1900 6250 1900
Wire Wire Line
	6250 1900 6250 4350
Wire Wire Line
	6250 4350 2450 4350
Wire Wire Line
	5600 1800 6350 1800
Wire Wire Line
	6350 1800 6350 4650
Wire Wire Line
	6350 4650 2450 4650
$Comp
L GND #PWR029
U 1 1 58BAA881
P 4100 1600
F 0 "#PWR029" H 4100 1350 50  0001 C CNN
F 1 "GND" H 4100 1450 50  0000 C CNN
F 2 "" H 4100 1600 50  0000 C CNN
F 3 "" H 4100 1600 50  0000 C CNN
	1    4100 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 1600 4300 1600
Wire Wire Line
	4200 1600 4200 1700
Wire Wire Line
	4200 1700 4300 1700
Connection ~ 4200 1600
Wire Wire Line
	3550 2850 7250 2850
Wire Wire Line
	7250 2850 7250 4650
Wire Wire Line
	7250 4650 7550 4650
Wire Wire Line
	4300 2500 4200 2500
Wire Wire Line
	4200 2500 4200 2950
Wire Wire Line
	4200 2950 7150 2950
Wire Wire Line
	7150 2950 7150 5050
Wire Wire Line
	7150 5050 7550 5050
Wire Wire Line
	7050 4750 7550 4750
Wire Wire Line
	7050 3050 7050 4750
Wire Wire Line
	7050 3050 4000 3050
Wire Wire Line
	4000 3050 4000 2300
Wire Wire Line
	4000 2300 4300 2300
Wire Wire Line
	4300 2400 4100 2400
Wire Wire Line
	4100 2400 4100 3150
Wire Wire Line
	4100 3150 6950 3150
Wire Wire Line
	6950 3150 6950 4850
Wire Wire Line
	6950 4850 7550 4850
Wire Wire Line
	6750 5150 7550 5150
Wire Wire Line
	6750 3350 6750 5150
Wire Wire Line
	6750 3350 3800 3350
Wire Wire Line
	3800 3350 3800 2100
Wire Wire Line
	3800 2100 4300 2100
Wire Wire Line
	4300 2200 3700 2200
Wire Wire Line
	3700 2200 3700 3450
Wire Wire Line
	3700 3450 6650 3450
Wire Wire Line
	6650 3450 6650 5250
Wire Wire Line
	6650 5250 7550 5250
$Comp
L CONN_01X04 P3
U 1 1 58BAC023
P 8900 2350
F 0 "P3" H 8900 2600 50  0000 C CNN
F 1 "HC-SR04" V 9000 2350 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04" H 8900 2350 50  0001 C CNN
F 3 "" H 8900 2350 50  0000 C CNN
	1    8900 2350
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR030
U 1 1 58BAC50C
P 8600 2200
F 0 "#PWR030" H 8600 2050 50  0001 C CNN
F 1 "+5V" H 8600 2340 50  0000 C CNN
F 2 "" H 8600 2200 50  0000 C CNN
F 3 "" H 8600 2200 50  0000 C CNN
	1    8600 2200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8700 2200 8600 2200
$Comp
L GND #PWR031
U 1 1 58BAC639
P 8600 2500
F 0 "#PWR031" H 8600 2250 50  0001 C CNN
F 1 "GND" H 8600 2350 50  0000 C CNN
F 2 "" H 8600 2500 50  0000 C CNN
F 3 "" H 8600 2500 50  0000 C CNN
	1    8600 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	8700 2500 8600 2500
Text Label 6450 2500 0    60   ~ 0
DIST_ECHO
Text Label 6450 2200 0    60   ~ 0
DIST_TRIG
Text Label 4650 2850 0    60   ~ 0
MOTOR_L_EN
Text Label 6450 3050 0    60   ~ 0
MOTOR_L_1A
Text Label 6450 3150 0    60   ~ 0
MOTOR_L_2A
Text Label 4650 2950 0    60   ~ 0
MOTOR_R_EN
Text Label 4650 3350 0    60   ~ 0
MOTOR_R_3A
Text Label 4650 3450 0    60   ~ 0
MOTOR_R_4A
$Comp
L CONN_01X04 P1
U 1 1 58BAD968
P 1800 1850
F 0 "P1" H 1800 2100 50  0000 C CNN
F 1 "I2C" V 1900 1850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04" H 1800 1850 50  0001 C CNN
F 3 "" H 1800 1850 50  0000 C CNN
	1    1800 1850
	-1   0    0    -1  
$EndComp
$Comp
L +5V #PWR032
U 1 1 58BAD96E
P 2100 1700
F 0 "#PWR032" H 2100 1550 50  0001 C CNN
F 1 "+5V" H 2100 1840 50  0000 C CNN
F 2 "" H 2100 1700 50  0000 C CNN
F 3 "" H 2100 1700 50  0000 C CNN
	1    2100 1700
	0    1    -1   0   
$EndComp
Wire Wire Line
	2000 1700 2100 1700
$Comp
L GND #PWR033
U 1 1 58BAD975
P 2100 2000
F 0 "#PWR033" H 2100 1750 50  0001 C CNN
F 1 "GND" H 2100 1850 50  0000 C CNN
F 2 "" H 2100 2000 50  0000 C CNN
F 3 "" H 2100 2000 50  0000 C CNN
	1    2100 2000
	0    -1   1    0   
$EndComp
Wire Wire Line
	2000 2000 2100 2000
Wire Wire Line
	2000 1800 4300 1800
Wire Wire Line
	2000 1900 4300 1900
Text Label 3700 1800 0    60   ~ 0
SDA
Text Label 3700 1900 0    60   ~ 0
SCL
$Comp
L Led_Small D6
U 1 1 58BAE71E
P 7650 2600
F 0 "D6" H 7600 2725 50  0000 L CNN
F 1 "HEARTBEAT" H 7475 2500 50  0000 L CNN
F 2 "LEDs:LED-5MM" V 7650 2600 50  0001 C CNN
F 3 "" V 7650 2600 50  0000 C CNN
	1    7650 2600
	-1   0    0    1   
$EndComp
$Comp
L RSMALL R11
U 1 1 58BAE7ED
P 7350 2600
F 0 "R11" V 7440 2595 40  0000 C CNN
F 1 "220" V 7265 2600 40  0000 C CNN
F 2 "Discret:R1" V 7280 2600 30  0001 C CNN
F 3 "" H 7350 2650 30  0000 C CNN
	1    7350 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	7450 2600 7550 2600
Wire Wire Line
	7750 2600 7850 2600
$Comp
L GND #PWR034
U 1 1 58BAEAF1
P 7850 2600
F 0 "#PWR034" H 7850 2350 50  0001 C CNN
F 1 "GND" H 7850 2450 50  0000 C CNN
F 2 "" H 7850 2600 50  0000 C CNN
F 3 "" H 7850 2600 50  0000 C CNN
	1    7850 2600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2450 5050 2450 4950
Wire Wire Line
	3450 2000 4300 2000
Text Label 3450 3250 1    60   ~ 0
ADC_1
Text Label 3850 4050 0    60   ~ 0
ADC_2
Text Label 3850 4350 0    60   ~ 0
ADC_3
Text Label 3850 4650 0    60   ~ 0
ADC_4
Text Label 3850 4950 0    60   ~ 0
ADC_5
Wire Wire Line
	5800 2600 7250 2600
$Comp
L MOUNTING_HOLE MP1
U 1 1 58BB19F0
P 5300 7250
F 0 "MP1" H 5300 7150 20  0000 C CNN
F 1 "MOUNTING_HOLE" H 5300 7350 20  0000 C CNN
F 2 "DigitalCave:MOUNTING_HOLE_#6" H 5300 7250 60  0001 C CNN
F 3 "" H 5300 7250 60  0000 C CNN
	1    5300 7250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR035
U 1 1 58BB1FBC
P 5150 7250
F 0 "#PWR035" H 5150 7000 50  0001 C CNN
F 1 "GND" H 5150 7100 50  0000 C CNN
F 2 "" H 5150 7250 50  0000 C CNN
F 3 "" H 5150 7250 50  0000 C CNN
	1    5150 7250
	0    1    -1   0   
$EndComp
Wire Wire Line
	5150 7250 5200 7250
$Comp
L MOUNTING_HOLE MP2
U 1 1 58BB22F4
P 5300 7550
F 0 "MP2" H 5300 7450 20  0000 C CNN
F 1 "MOUNTING_HOLE" H 5300 7650 20  0000 C CNN
F 2 "DigitalCave:MOUNTING_HOLE_#6" H 5300 7550 60  0001 C CNN
F 3 "" H 5300 7550 60  0000 C CNN
	1    5300 7550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR036
U 1 1 58BB22FA
P 5150 7550
F 0 "#PWR036" H 5150 7300 50  0001 C CNN
F 1 "GND" H 5150 7400 50  0000 C CNN
F 2 "" H 5150 7550 50  0000 C CNN
F 3 "" H 5150 7550 50  0000 C CNN
	1    5150 7550
	0    1    -1   0   
$EndComp
Wire Wire Line
	5150 7550 5200 7550
$Comp
L MOUNTING_HOLE MP3
U 1 1 58BB23D9
P 5850 7250
F 0 "MP3" H 5850 7150 20  0000 C CNN
F 1 "MOUNTING_HOLE" H 5850 7350 20  0000 C CNN
F 2 "DigitalCave:MOUNTING_HOLE_#6" H 5850 7250 60  0001 C CNN
F 3 "" H 5850 7250 60  0000 C CNN
	1    5850 7250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR037
U 1 1 58BB23DF
P 5700 7250
F 0 "#PWR037" H 5700 7000 50  0001 C CNN
F 1 "GND" H 5700 7100 50  0000 C CNN
F 2 "" H 5700 7250 50  0000 C CNN
F 3 "" H 5700 7250 50  0000 C CNN
	1    5700 7250
	0    1    -1   0   
$EndComp
Wire Wire Line
	5700 7250 5750 7250
$Comp
L MOUNTING_HOLE MP4
U 1 1 58BB23E6
P 5850 7550
F 0 "MP4" H 5850 7450 20  0000 C CNN
F 1 "MOUNTING_HOLE" H 5850 7650 20  0000 C CNN
F 2 "DigitalCave:MOUNTING_HOLE_#6" H 5850 7550 60  0001 C CNN
F 3 "" H 5850 7550 60  0000 C CNN
	1    5850 7550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR038
U 1 1 58BB23EC
P 5700 7550
F 0 "#PWR038" H 5700 7300 50  0001 C CNN
F 1 "GND" H 5700 7400 50  0000 C CNN
F 2 "" H 5700 7550 50  0000 C CNN
F 3 "" H 5700 7550 50  0000 C CNN
	1    5700 7550
	0    1    -1   0   
$EndComp
Wire Wire Line
	5700 7550 5750 7550
Text Notes 4650 1000 0    60   ~ 0
Microcontroller
Text Notes 1650 1500 0    60   ~ 0
I2C Expansion Port
Wire Wire Line
	3450 2000 3450 3750
Text Notes 8300 2000 0    60   ~ 0
Distance Sensor Expansion
Text Notes 7900 3700 0    60   ~ 0
Motor Driver
$Comp
L CONN_01X02 P6
U 1 1 58BBC321
P 5100 6600
F 0 "P6" H 5100 6750 50  0000 C CNN
F 1 "BATT" V 5200 6600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 5100 6600 50  0001 C CNN
F 3 "" H 5100 6600 50  0000 C CNN
	1    5100 6600
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR039
U 1 1 58BBC530
P 4800 6550
F 0 "#PWR039" H 4800 6400 50  0001 C CNN
F 1 "+BATT" H 4800 6690 50  0000 C CNN
F 2 "" H 4800 6550 50  0000 C CNN
F 3 "" H 4800 6550 50  0000 C CNN
	1    4800 6550
	0    -1   1    0   
$EndComp
Wire Wire Line
	4800 6550 4900 6550
Wire Wire Line
	4900 6650 4800 6650
$Comp
L GND #PWR040
U 1 1 58BBC729
P 4800 6750
F 0 "#PWR040" H 4800 6500 50  0001 C CNN
F 1 "GND" H 4800 6600 50  0000 C CNN
F 2 "" H 4800 6750 50  0000 C CNN
F 3 "" H 4800 6750 50  0000 C CNN
	1    4800 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 6650 4800 6750
Text Notes 4550 6300 0    60   ~ 0
Battery Connector
Wire Wire Line
	4300 1400 3550 1400
Wire Wire Line
	3550 1400 3550 2850
$Comp
L GRAPHIC MP5
U 1 1 58BBE16D
P 5850 6800
F 0 "MP5" H 5850 6750 20  0000 C CNN
F 1 "GRAPHIC" H 5850 6850 20  0000 C CNN
F 2 "DigitalCave:DIGITALCAVE_LOGO" H 5850 6800 60  0001 C CNN
F 3 "" H 5850 6800 60  0000 C CNN
	1    5850 6800
	1    0    0    -1  
$EndComp
$Comp
L GRAPHIC MP6
U 1 1 58BBE5A4
P 5850 6950
F 0 "MP6" H 5850 6900 20  0000 C CNN
F 1 "GRAPHIC" H 5850 7000 20  0000 C CNN
F 2 "DigitalCave:DIGITALCAVE_URL" H 5850 6950 60  0001 C CNN
F 3 "" H 5850 6950 60  0000 C CNN
	1    5850 6950
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH_SMALL SW1
U 1 1 58C062FA
P 6850 1700
F 0 "SW1" H 7000 1810 50  0000 C CNN
F 1 "BUTTON" H 6850 1621 50  0000 C CNN
F 2 "Buttons_Switches_ThroughHole:SW_PUSH_SMALL" H 6850 1700 50  0001 C CNN
F 3 "" H 6850 1700 50  0000 C CNN
	1    6850 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 1600 6650 1600
$Comp
L GND #PWR041
U 1 1 58C06752
P 6650 1600
F 0 "#PWR041" H 6650 1350 50  0001 C CNN
F 1 "GND" H 6650 1450 50  0000 C CNN
F 2 "" H 6650 1600 50  0000 C CNN
F 3 "" H 6650 1600 50  0000 C CNN
	1    6650 1600
	0    1    -1   0   
$EndComp
Text Notes 6600 1500 0    60   ~ 0
Button
Wire Wire Line
	6950 1800 6950 2400
NoConn ~ 4300 1500
NoConn ~ 5600 1400
$Comp
L CP1_Small C1
U 1 1 58C19D02
P 4000 7100
F 0 "C1" H 4010 7170 50  0000 L CNN
F 1 "CAP" H 3800 7100 50  0000 L CNN
F 2 "Capacitors_THT:C_Radial_D8_L13_P3.8" H 4000 7100 50  0001 C CNN
F 3 "" H 4000 7100 50  0000 C CNN
	1    4000 7100
	-1   0    0    1   
$EndComp
Wire Wire Line
	4000 7200 4000 7250
Wire Wire Line
	4000 7250 3750 7250
Connection ~ 3750 7250
Wire Wire Line
	4000 7000 4000 6900
Connection ~ 4000 6900
Wire Wire Line
	3450 3750 2450 3750
Wire Wire Line
	2450 4950 6050 4950
Wire Wire Line
	5600 2200 7050 2200
Wire Wire Line
	7050 2200 7050 2300
Wire Wire Line
	7050 2300 8700 2300
Wire Wire Line
	5600 2500 7050 2500
Wire Wire Line
	7050 2500 7050 2400
Wire Wire Line
	7050 2400 8700 2400
Wire Wire Line
	5800 2300 5800 2600
Wire Wire Line
	5600 2300 5800 2300
Wire Wire Line
	6950 2400 5600 2400
$EndSCHEMATC
