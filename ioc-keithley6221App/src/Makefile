# SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#
# SPDX-License-Identifier: EPICS

TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = ioc-keithley6221

# $(PROD_IOC).dbd will be created and installed
DBD += $(PROD_IOC).dbd

# $(PROD_IOC).dbd will be made up from these files:
$(PROD_IOC)_DBD += base.dbd

# Include dbd files from all support applications:
#$(PROD_IOC)_DBD += xxx.dbd
$(PROD_IOC)_DBD += asyn.dbd
$(PROD_IOC)_DBD += calc.dbd calcSupport.dbd
$(PROD_IOC)_DBD += stream.dbd
$(PROD_IOC)_DBD += drvAsynSerialPort.dbd
$(PROD_IOC)_DBD += drvAsynIPPort.dbd

# Add all the support libraries needed by this IOC
#$(PROD_IOC)_LIBS += xxx
$(PROD_IOC)_LIBS += stream asyn calc

# $(PROD_IOC)_registerRecordDeviceDriver.cpp derives from $(PROD_IOC).dbd
$(PROD_IOC)_SRCS += $(PROD_IOC)_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
$(PROD_IOC)_SRCS_DEFAULT += $(PROD_IOC)Main.cpp
$(PROD_IOC)_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#$(PROD_IOC)_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
$(PROD_IOC)_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

