void checkParameters();
void initParameters();

void start() {
  Serial.begin(115200);
  setupParameters(); // we load paramters from the EEPROM
  checkParameters(); // setup automatically the default parameter after install boot loader
  initParameters();
  nilSysBegin();
    #ifdef THR_WIRE_SLAVE
      startWireSlave();
    #endif
}