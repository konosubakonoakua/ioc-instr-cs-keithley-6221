#!../../bin/linux-x86_64/ioc-keithley6221

#- SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS

#- You may have to change ioc-keithley6221 to something else
#- everywhere it appears in this file

< envPaths
< customEnvPaths

epicsEnvSet "STREAM_PROTOCOL_PATH" "$(TOP)/db"

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/ioc-keithley6221.dbd"
ioc_keithley6221_registerRecordDeviceDriver pdbbase

## debug
var streamError 1
var streamDebug 1
var streamDebugColored 1
var streamErrorDeadTime 30
var streamMsgTimeStamped 1
streamSetLogfile("logfile.txt")

## defined in envPaths
drvAsynIPPortConfigure("L0", $(IPPORT), 0, 0, 0)

## Load record instances
#dbLoadRecords("db/ioc-keithley6221.db","user=rf")
dbLoadRecords("$(TOP)/db/devkeithley6221.db", "P=$(P), R=$(R), PORT=L0, A=0")
dbLoadRecords("$(TOP)/db/asynRecord.db", "P=$(P)$(R), R=Asyn, PORT=L0, ADDR=0, OMAX=0, IMAX=0")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=rf"
