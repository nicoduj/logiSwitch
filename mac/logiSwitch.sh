#!/bin/bash

#chmod +x switch.sh 

# to get all info for the script. Typîcally, interface will be the KB / MSE id.
#./hidapitester --vidpid 046D:C52B --list-detail
# imac-de-nico:GitHub nico$ ./hidapitester --vidpid 046D:C52B --list-detail 
# 046D/C52B: Logitech - USB Receiver
#   vendorId:      0x046D
#   productId:     0xC52B
#   usagePage:     0x0001
#   usage:         0x0006
#   serial_number:  
#   interface:     0 
#   path: IOService:/AppleACPIPlatformExpert/PCI0@0/AppleACPIPCI/XHC1@14/XHC1@14000000/HS10@14600000/USB Receiver@14600000/IOUSBHostInterface@0/AppleUserUSBHostHIDDevice

# 046D/C52B: Logitech - USB Receiver
#   vendorId:      0x046D
#   productId:     0xC52B
#   usagePage:     0x0001
#   usage:         0x0002
#   serial_number:  
#   interface:     1
#   path: IOService:/AppleACPIPlatformExpert/PCI0@0/AppleACPIPCI/XHC1@14/XHC1@14000000/HS10@14600000/USB Receiver@14600000/IOUSBHostInterface@1/AppleUserUSBHostHIDDevice

# 046D/C52B: Logitech - USB Receiver
#   vendorId:      0x046D
#   productId:     0xC52B
#   usagePage:     0xFF00
#   usage:         0x0001
#   serial_number:  
#   interface:     2 
#   path: IOService:/AppleACPIPlatformExpert/PCI0@0/AppleACPIPCI/XHC1@14/XHC1@14000000/HS10@14600000/USB Receiver@14600000/IOUSBHostInterface@2/AppleUserUSBHostHIDDevice

# KYB_CH = channel on unifying receiver for the destination keyboard. Typically maps to the 1 minus the key # you press to switch keyboards
KYB_CH=0x01
# KYB_ID = ID of the keyboard (typically this maps to the order of keyboard devices you see in the unifying software app in Advanced settings)
KYB_ID=0x01

# MSE_CH = channel on unifying receiver for the destination mouse. Typically maps 1 minus the channel button you press on the mouse to switch
MSE_CH=0x01
# MSE_ID = ID of the mouse (typically this maps to the order of mouse devices you see in the unifying software app in Advanced settings)
MSE_ID=0x02

# These typically don't change, but tap Apple menu->About This Mac->System Report->USB->USB Receiver for Logitech 
# and make sure Product ID (RCVR_PID) and Vendor ID (RCVR_VID) are accurate 
RCVR_VID=046D
RCVR_PID=C52B


# Switch MX Mouse to other device
#                                                                                                                 A       B       C   D       E      F    G
/Applications/logiSwitch/hidapitester --vidpid ${RCVR_VID}:${RCVR_PID} --usage 0x0001 --usagePage 0xFF00 --open --length 7 --send-output 0x10,${MSE_ID},0x0a,0x1b,${MSE_CH},0x00,0x00



# Switch MX Keys to other device
#                                                                                                                 A        B    C    D       E       F    G
/Applications/logiSwitch/hidapitester --vidpid ${RCVR_VID}:${RCVR_PID} --usage 0x0001 --usagePage 0xFF00 --open --length 7 --send-output 0x10,${KYB_ID},0x09,0x1e,${KYB_CH},0x00,0x00
sleep 2
# Sending twice since when keyboard is sleeping, might need to wake up
/Applications/logiSwitch/hidapitester --vidpid ${RCVR_VID}:${RCVR_PID} --usage 0x0001 --usagePage 0xFF00 --open --length 7 --send-output 0x10,${KYB_ID},0x09,0x1e,${KYB_CH},0x00,0x00


exit 0
