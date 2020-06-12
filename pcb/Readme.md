PH Meter

PH Meter and Conductometer that can work independently

- LCD screen (2 lines) (8 pins).
- Rotary push button (3 pins).
- RJ-12 connector to a master.
- ATMEGA32U4.
- 64 Mbit memory ISP.
- 2 pumps.

[Arduino Leonardo](https://www.arduino.cc/en/Hacking/PinMapping32u4)

| Arduino | Port | Function  | Assigned       |
|---------|------|-----------|----------------|
| 0       | 20   | RX        | Programming    |
| 1       | 21   | TX        | Programming    |
| 2       | 19   | SDA       | RJ-12 SDA      |
| 3       | 18   | SCL       | RJ-12 SCL      |
| 4       | 25   |           | rotary 2       |Lylipad
| 5       | 31   |           | rotary push    |
| 6       | 27   | OC0A      | LCD 1          |
| 7       | 1    |           | LCD 2          |
| 8       | 28   |           | LCD 3          |
| 9       | 29   | OC1A      |                |
| 10      | 30   | SS        |                |
| 11      | 12   | MOSI      | ICSP           |
| 12      | 26   | MISO      | ICSP           |
| 13      | 32   | SCK       | ICSP           |
| A0      | 36   |           | LCD 4  - Power |
| A1      | 37   |           | LCD 5          |
| A2      | 38   |           | LCD 6          |
| A3      | 39   |           | LCD 7          |
| A4      | 40   |           |                |
| A5      | 41   |           |                |
| D18     |      | INT0      | rotary 1       |
| D19     |      | INT1 OC2B |                |
