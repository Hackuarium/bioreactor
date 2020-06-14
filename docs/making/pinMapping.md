Pin mapping
===========

Port | Pin | Arduino Mask     |                         | Bertha V4.4
-----|-----|------------------|-------------------------|-------------------
D    | 2   | D0 / RX          | RX D1/AIN1/INT2         |
D    | 3   | D1 / TX          | TXD1/INT3               | Memory CS
D    | 1   | D2 / SDA         | SDA/INT1                | I2C SDA
D    | 0   | D3 / SCL         | OC0B/SCL/INT0           | I2C SCL
D    | 4   | D4 / A6          | ICP1/ADC8               | IO3
C    | 6   | D5 (PWM)         | OC3A/#0C4A              | IO2 / PWM food OUT
D    | 7   | D6 (PWM)         | T0/OC4D/ADC10           | PID on PWM
E    | 6   | D7               | PE6 (INT.6/AIN0)        | Ext. OneWire 1
B    | 4   | D8 / A8          | ADC11/PCINT4            | Stepper direction
B    | 5   | D9 / A9          | PCINT5/OC1A/#OC4B/ADC12 | Stepper step
B    | 6   | D10 / A10        | PCINT6/OC1B/OC4B/ADC13  | IO1 / PWM food IN
B    | 7   | D11 (PWM)        | PCINT7/OC0A/OC1C/#RTS   | FAN control
D    | 6   | D12 / A11        | T1/#OC4D/ADC9           | IO4
C    | 7   | D13 (PWM)        | ICP3/CLK0/)0C4A         | Blink Led
B    | 3   | MISO / D14       | PDO/PCINT3/MISO         | Memory MISO
B    | 1   | SCK / D15        | PCINT1/SCLK             | Memory SCK
B    | 2   | MOSI / D16       | PDI/PCINT2/MOSI         | Memory MOSI
B    | 0   | RXLED / SS / D17 | SS/PCINT0               | RXLED
F    | 7   | A0 / D18         | ADC7/TDI                | CLK HX711
F    | 6   | A1 / D19         | ADC6/TDO                | Data HX711
F    | 5   | A2 / D20         | ADC5/TMS                | OneWire PCB
F    | 4   | A3 / D21         | ADC4/TCK                |
F    | 1   | A4 / D22         | ADC1                    |
F    | 0   | A5 / D23         | ADC0                    | Ext. OneWire 2
D    | 5   | TXLED / D30      | XCK1/#CTS               | TXLED
E    | 2   | HWB              |                         | HWB
