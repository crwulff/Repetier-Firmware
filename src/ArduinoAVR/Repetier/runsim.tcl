#! /usr/bin/wish8.6
#
###############################################################################
#
# LCD and Serial IO example for simulavrxx
#
# Last modifications:
# 02-Sep-2008 KSchwi previous example LCD extended by Serial Rx / TX
#
###############################################################################
#
#  $Id$
#

#
#set traceFile trace

#we use some itcl :-)
package require Itcl

#load the avr-simulator package
load $::env(SIMULAVR)/src/.libs/libsimulavr.so
puts "simulavr loaded"

#now start external generic gui server
exec /usr/bin/wish $::env(SIMULAVR)/examples/gui.tcl &

#start the trace output to given filename
#StartTrace $traceFile

#start the user interface client
set ui [new_UserInterface 7777 ]

#create new device
set dev1 [new_AvrDevice_atmega2560]

#load elf file to the device
AvrDevice_Load $dev1 "bin/Release/Repetier_mega2560.elf"

#set the clock cycle time [ns].  Here ~3.686400 MHz
AvrDevice_SetClockFreq $dev1 63

#systemclock must know that this device will be stepped from application
set sc [GetSystemClock]

#also the gui updates after each cycle
$sc AddAsyncMember $ui

# Serial transmitter and receiver Net
Net ser_rxD0
Net ser_txD0

#create a Pin for serial in and serial out of the LCD-board
ExtPin exttxD0 $Pin_PULLUP $ui "txD0" ".x"
ExtPin extrxD0 $Pin_PULLUP $ui "rxD0" ".x"

#create a serial in and serial out component
SerialRx mysrx $ui "serialRx0" ".x"
SerialRxBasic_SetBaudRate mysrx 57600
SerialTx mystx $ui "serialTx0" ".x"
SerialTxBuffered_SetBaudRate mystx 57600

# wire the serial display receiver
ser_rxD0 Add [AvrDevice_GetPin $dev1 "E1"]
ser_rxD0 Add extrxD0
ser_rxD0 Add [SerialRxBasic_GetPin mysrx "rx"]

# wire the serial display transmitter
ser_txD0 Add [AvrDevice_GetPin $dev1 "E0"]
ser_txD0 Add exttxD0
ser_txD0 Add [SerialTxBuffered_GetPin mystx "tx"]


# Motor 1
UserInterface_Write $ui "frame .x.m1 -relief raised -borderwidth 1\n"
UserInterface_Write $ui "pack .x.m1 -expand 1\n"

MotorController m1 $ui "motor1" ".x.m1"

Net M1_ENA
ExtPin extMotor1_ENA $Pin_PULLUP $ui "m1_ENA" ".x.m1"
M1_ENA Add [AvrDevice_GetPin $dev1 "L3"]
M1_ENA Add [MotorController_GetPin m1 "ENA"]
M1_ENA Add extMotor1_ENA

Net M1_DIR
ExtPin extMotor1_DIR $Pin_PULLUP $ui "m1_DIR" ".x.m1"
M1_DIR Add [AvrDevice_GetPin $dev1 "L2"]
M1_DIR Add [MotorController_GetPin m1 "DIR"]
M1_DIR Add extMotor1_DIR

Net M1_PUL
ExtPin extMotor1_PUL $Pin_PULLUP $ui "m1_PUL" ".x.m1"
M1_PUL Add [AvrDevice_GetPin $dev1 "L4"]
M1_PUL Add [MotorController_GetPin m1 "PUL"]
M1_PUL Add extMotor1_PUL

# Motor 2
UserInterface_Write $ui "frame .x.m2 -relief raised -borderwidth 1\n"
UserInterface_Write $ui "pack .x.m2 -expand 1\n"

MotorController m2 $ui "motor2" ".x.m2"

Net M2_ENA
ExtPin extMotor2_ENA $Pin_PULLUP $ui "m2_ENA" ".x.m2"
M2_ENA Add [AvrDevice_GetPin $dev1 "B1"]
M2_ENA Add [MotorController_GetPin m2 "ENA"]
M2_ENA Add extMotor2_ENA

Net M2_DIR
ExtPin extMotor2_DIR $Pin_PULLUP $ui "m2_DIR" ".x.m2"
M2_DIR Add [AvrDevice_GetPin $dev1 "B0"]
M2_DIR Add [MotorController_GetPin m2 "DIR"]
M2_DIR Add extMotor2_DIR

Net M2_PUL
ExtPin extMotor2_PUL $Pin_PULLUP $ui "m2_PUL" ".x.m2"
M2_PUL Add [AvrDevice_GetPin $dev1 "B2"]
M2_PUL Add [MotorController_GetPin m2 "PUL"]
M2_PUL Add extMotor2_PUL

# Motor 3
UserInterface_Write $ui "frame .x.m3 -relief raised -borderwidth 1\n"
UserInterface_Write $ui "pack .x.m3 -expand 1\n"

MotorController m3 $ui "motor3" ".x.m3"

Net M3_ENA
ExtPin extMotor3_ENA $Pin_PULLUP $ui "m3_ENA" ".x.m3"
M3_ENA Add [AvrDevice_GetPin $dev1 "B3"]
M3_ENA Add [MotorController_GetPin m3 "ENA"]
M3_ENA Add extMotor3_ENA

Net M3_DIR
ExtPin extMotor3_DIR $Pin_PULLUP $ui "m3_DIR" ".x.m3"
M3_DIR Add [AvrDevice_GetPin $dev1 "L1"]
M3_DIR Add [MotorController_GetPin m3 "DIR"]
M3_DIR Add extMotor3_DIR

Net M3_PUL
ExtPin extMotor3_PUL $Pin_PULLUP $ui "m3_PUL" ".x.m3"
M3_PUL Add [AvrDevice_GetPin $dev1 "L0"]
M3_PUL Add [MotorController_GetPin m3 "PUL"]
M3_PUL Add extMotor3_PUL

# Sensors
UserInterface_Write $ui "frame .x.m1.es -relief raised -borderwidth 1\n"
UserInterface_Write $ui "pack .x.m1.es -expand 1\n"

UserInterface_Write $ui "frame .x.m2.es -relief raised -borderwidth 1\n"
UserInterface_Write $ui "pack .x.m2.es -expand 1\n"

UserInterface_Write $ui "frame .x.m3.es -relief raised -borderwidth 1\n"
UserInterface_Write $ui "pack .x.m3.es -expand 1\n"

Net ES1
ExtPin ext_ES1 $Pin_PULLUP $ui "es1_XMIN" ".x.m1.es"
ES1 Add [AvrDevice_GetPin $dev1 "G0"]
ES1 Add [MotorController_GetPin m1 "ESL"]
ES1 Add ext_ES1

Net ES2
ExtPin ext_ES2 $Pin_PULLUP $ui "es2_XMAX" ".x.m1.es"
ES2 Add [AvrDevice_GetPin $dev1 "L6"]
ES2 Add [MotorController_GetPin m1 "ESR"]
ES2 Add ext_ES2

Net ES3
ExtPin ext_ES3 $Pin_PULLUP $ui "es3_ZMIN" ".x.m3.es"
ES3 Add [AvrDevice_GetPin $dev1 "D7"]
ES3 Add [MotorController_GetPin m3 "ESL"]
ES3 Add ext_ES3

Net ES4
ExtPin ext_ES4 $Pin_PULLUP $ui "es4_YMAX" ".x.m2.es"
ES4 Add [AvrDevice_GetPin $dev1 "G1"]
ES4 Add [MotorController_GetPin m2 "ESR"]
ES4 Add ext_ES4

Net ES5
ExtPin ext_ES5 $Pin_PULLUP $ui "es5_YMIN" ".x.m2.es"
ES5 Add [AvrDevice_GetPin $dev1 "L7"]
ES5 Add [MotorController_GetPin m2 "ESL"]
ES5 Add ext_ES5

Net ES6
ExtPin ext_ES6 $Pin_PULLUP $ui "es6_ZMAX" ".x.m3.es"
ES6 Add [AvrDevice_GetPin $dev1 "L5"]
ES6 Add [MotorController_GetPin m3 "ESR"]
ES6 Add ext_ES6


puts "Simulation runs endless, please press CTRL-C to abort"

GdbServer gdb1 $dev1 1212 0
$sc Add gdb1

#now run simulation
$sc Endless

