# Tips

## Configure permission for USBTinyISP

- Check the ID for USBTinyISP:

´´´
$ lsusb
´´´

´´´
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 005: ID 8087:0a2b Intel Corp.
Bus 001 Device 006: ID 047f:0115 Plantronics, Inc. Voyager Legend
Bus 001 Device 003: ID 046d:c31c Logitech, Inc. Keyboard K120
Bus 001 Device 002: ID 046d:c011 Logitech, Inc. Optical MouseMan
Bus 001 Device 007: ID 1781:0c9f Multiple Vendors USBtiny
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
´´´

Show _Device 007_ permissions:

´´´
$ ls -al /dev/bus/usb/001/007
´´´

´´´
crw-rw---- 1 root root 189, 6 Okt 2 09:45 /dev/bus/usb/001/007
´´´

Change permissions:

´´´
$ sudo chmod 666 /dev/bus/usb/001/007
´´´

Check the new permissions:

´´´
$ ls -al /dev/bus/usb/001/007
´´´

´´´
crw-rw-rw- 1 root root 189, 6 Okt 2 09:45 /dev/bus/usb/001/007
´´´

## Pin Configuration - Bioreactor V 6.0.1

Based on: [ATMEGA32U4 - Arduino Lilypad USB/Leonardo](https://docs.arduino.cc/hacking/hardware/PinMapping32u4)

| µC Pin | Pin Port | Digital Port | Analog Port | Alternate Functions              | Arduino Functions | Incubator Functions       | Description                                                                                              |
| ------ | -------- | ------------ | ----------- | -------------------------------- | ----------------- | ------------------------- | -------------------------------------------------------------------------------------------------------- |
| 1      | PE6      | 7             |             | INT6 <br /> /AIN0            |             | TEMP_EXT1                    | - External Interrupt 6 Input. <br /> - Analog Comparator Positive Input. |
| 2      | UVcc      |             |             |                |                 |                         | USB Pads Internal Regulator Input supply voltage.                                                                         |
| 3      | D-      |             |             |                | RD-                | D-                        | USB Full speed / Low Speed Negative Data Upstream Port. Should be connected to the USB D- connector pin with a serial 22 Ohm resistor.                                                                         |
| 4      | D+      |             |             |               | RD+                  | D+                          | USB Full speed / Low Speed Positive Data Upstream Port. Should be connected to the USB D+ connector pin with a serial 22 Ohm resistor.                                                                                                         |
| 5      | UGND      |             |             |   | UGND               | GND                          |   USB Pads Ground.                                                                                                       |
| 6      | UCap      |             |             |      |                   |                           | USB Pads Internal Regulator Output supply voltage. Should be connected to an external capacitor (1μF).                                                                                                         |
| 7      | VBus      |              |             |                                  | VUSB                  |                           | USB VBUS monitor input.                                                                                    |
| 8      | PB0      |              |             | /SS <br /> PCINT0                                 |        RXLED           |  RXLED                         | - SPI Slave Select input. <br /> - Pin Change Interrupt 0.                                                                                             |
| 9      | PB1      |              |             | SCK <br /> PCINT1 | SCK              |                           | - SPI Bus Serial Clock. <br /> - Pin Change Interrupt 1.               |
| 10     | PB2      |              |             | PDI <br /> MOSI <br /> PCINT2 | MOSI              |      MOSI                     | - Programming Data Input. <br /> - SPI Bus Master Output/Slave Input. <br /> - Pin Change Interrupt 2.               |
| 11     | PB3      |             |             | PDO <br /> MISO <br /> PCINT3                | MISO               | MISO                   | - Programming Data Output. <br /> - SPI Bus Master Input/Slave Output. <br /> - Pin Change Interrupt 3.                                                                                     |
| 12     | PB7      | 11            |             | OC0A <br /> OC1C <br /> PCINT7 <br /> /RTS   | PWM               | OUT_FAN               | - Output Compare and PWM Output A for Timer/Counter0. <br /> - Output Compare and PWM Output C for Timer/Counter1. <br /> - Pin Change Interrupt 7. <br /> - UART flow control RTS signal.                                                                  |
| 13     | /RESET      |             |             |               | /RESET                  | /RESET                          | Reset input.                                                                                                         |
| 14     | Vcc      |             |             |    |    VCC               |  VCC                         |                                                                                                          |
| 15     | GND      |             |             |                |       GND         |  GND                         |                                                                                                          |
| 16     | XTAL2      |            |             |      | XTAL2     | XTAL2                 |                                                                               |
| 17     | XTAL1      |            |             |    | XTAL1  | XTAL1                      |                                                                           |
| 18     | PD0      |       3     |             | /INT0 <br /> SCL <br /> OC0B               | SCL <br /> PWM   | SCL                      | - External Interrupt0 Input. <br /> - TWI Serial CLock. <br /> - Output Compare for Timer/Counter0.                                                                          |
| 19     | PD1      | 2           |             | /INT1 <br /> SDA                | SDA    | SDA | - External Interrupt1 Input. <br /> - TWI Serial Data.                                        |
| 20     | PD2      |  0            |             | /INT2 <br /> RXD1                                 |  RX                 | RX                          | - External Interrupt2 Input. <br /> - USART1 Receive Pin.                                                                                    |
| 21     | PD3     |  1            |             |  /INT3 <br > TXD1                                | TX                  |     TX                      | - External Interrupt3 Input. <br /> - USART1 Trasmit Pin.                                                                                                         |
| 22     | PD5      |              |             |    XCK1 <br /> /CTS                              |  TXLED                 | TXLED                           | - USART1 External Clock Input/Output. <br /> - UART flow control /CTS signal).                                                                                             |
| 23     | GND1      |            |           |                | GND         | GND                 |                                                           |
| 24     | AVCC      |            |           |                | AVCC         | VCC                 |                                                           |
| 25     | PD4      | 4           |           | ICP1 <br /> ADC8              |          | OUT_3                 | Pin for Input/Ouput 3.                                                         |
| 26     | PD6      | 12           |           | T1 <br /> /OC.4D <br /> ADC9              |           | OUT_4                  | - Pin for Input/Ouput 4. <br /> - Timer/Counter1 Clock Input . <br /> - Timer 4 Output Complementary Compare D / PWM output. <br /> - Analog to Digital Converter channel 9.                                                         |
| 27     | PD7      | 6           |           | T0 <br /> OC.4D <br /> ADC10   |     PWM              | PID_CONTROL                       | - Pin for PID control. <br /> - Timer/Counter0 Clock Input. <br /> - Timer 4 Output Compare D / PWM output. <br /> - Analog to Digital Converter channel 10.                                                              |
| 28     | PB4      | 8           |           | PCINT4 <br /> ADC11   |                   | STEPPER_DIRECTION                       | - Pin for stepper direction. <br /> - Pin Change Interrupt 4. <br /> - Analog to Digital Converter channel 11.                                                               |
| 29     | PB5      | 9           |           | OC1A <br /> PCINT5 <br /> /OC.4B <br /> ADC12   |     PWM              | STEPPER_STEP                       | - Pin for stepper steps. <br /> - Output Compare and PWM Output A for Timer/Counter1. <br /> - Pin Change Interrupt 5. <br /> - Timer 4 Complementary Output Compare B / PWM output. <br /> - Analog to Digital Converter channel 12.                                                               |
| 30     | PB6      | 10           |           | PCINT13 <br /> ADC5 <br /> SCL   |           PWM        | SCL                       | SCL pin for I2C communication (Slave I2C).                                                               |
| 31     | PC6      | 5           |           | PCINT12 <br /> ADC4 <br /> SDA   |     PWM              | SDA                       | SDA pin for I2C communication (Slave I2C).                                                               |
| 32     | PC7      | 13           |           | PCINT13 <br /> ADC5 <br /> SCL   |  PWM                 | SCL                       | SCL pin for I2C communication (Slave I2C).                                                               |
| 33     | PE2      |            |           | PCINT12 <br /> ADC4 <br /> SDA   |     /HWB              | /HWB                       | SDA pin for I2C communication (Slave I2C).                                                               |
| 34     | VCC1      |            |           | PCINT13 <br /> ADC5 <br /> SCL   |     VCC              | VCC                       | SCL pin for I2C communication (Slave I2C).                                                               |
| 35     | GND2      |            |           | PCINT12 <br /> ADC4 <br /> SDA   |     GND              | GND                       | SDA pin for I2C communication (Slave I2C).                                                               |
| 36     | PF7      |            |  A0         | PCINT13 <br /> ADC5 <br /> SCL   |                   | SCL                       | SCL pin for I2C communication (Slave I2C).                                                               |
| 37     | PF6      |            | A1          | PCINT12 <br /> ADC4 <br /> SDA   |                   | SDA                       | SDA pin for I2C communication (Slave I2C).                                                               |
| 38     | PF5      |            |  A2         | PCINT13 <br /> ADC5 <br /> SCL   |                   | SCL                       | SCL pin for I2C communication (Slave I2C).                                                               |
| 39     | PF4      |            | A3          | PCINT12 <br /> ADC4 <br /> SDA   |                   | SDA                       | SDA pin for I2C communication (Slave I2C).                                                               |
| 40     | PF1      |            |  A4         | PCINT13 <br /> ADC5 <br /> SCL   |                   | SCL                       | SCL pin for I2C communication (Slave I2C).                                                               |
| 41     | PF0      |            | A5          | PCINT12 <br /> ADC4 <br /> SDA   |                   | SDA                       | SDA pin for I2C communication (Slave I2C).                                                               |
| 42     | AREF      |            |           | PCINT13 <br /> ADC5 <br /> SCL   |    AREF               | AREF                       | SCL pin for I2C communication (Slave I2C).                                                               |
| 43     | GND3      |            |           | PCINT12 <br /> ADC4 <br /> SDA   |     GND              | GND                       | SDA pin for I2C communication (Slave I2C).                                                               |
| 44     | AVCC1      |            |           | PCINT13 <br /> ADC5 <br /> SCL   |      AVCC             | VCC                       | SCL pin for I2C communication (Slave I2C).                                                               |
