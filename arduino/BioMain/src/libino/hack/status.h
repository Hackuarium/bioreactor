
boolean isError(int filter) {
  if ((getParameter(PARAM_ERROR) & filter) != 0) return true;
  return false;
}

boolean isError() {
  return (getParameter(PARAM_ERROR) != 0);
}

boolean getStatus(byte statusFlag) {
  return getParameterBit(PARAM_STATUS, statusFlag);
}

boolean isEnabled(byte statusFlag) {
  return getParameterBit(PARAM_ENABLED, statusFlag);
}

boolean isRunning(byte statusFlag) {
  return getParameterBit(PARAM_STATUS, statusFlag);
}


boolean startProcess(byte statusFlag) {
  boolean statusChanged = setParameterBit(PARAM_STATUS, statusFlag);
#ifdef EVENT_LOGGING
  if (statusChanged) {
    writeLog(EVENT_STATUS_ENABLE, statusFlag);
  }
#endif
  return statusChanged;
}

boolean stopProcess(byte statusFlag) {
  boolean statusChanged =  clearParameterBit(PARAM_STATUS, statusFlag);
#ifdef EVENT_LOGGING
  if (statusChanged) {
    writeLog(EVENT_STATUS_DISABLE, statusFlag);
  }
#endif
  return statusChanged;
}