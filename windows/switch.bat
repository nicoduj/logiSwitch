rem to get info, use .\hidapitester --list and .\hidapitester --vidpid 046D:C52B --list-detail
rem https://github.com/marcelhoffs/input-switcher



rem KYB_CH = channel on unifying receiver for the destination keyboard. Typically maps to the 1 minus the key # you press to switch keyboards
set KYB_CH=0x00
rem KYB_ID = ID of the keyboard (typically this maps to the order of keyboard devices you see in the unifying software app in Advanced settings)
set KYB_ID=0x03

rem MSE_CH = channel on unifying receiver for the destination mouse. Typically maps 1 minus the channel button you press on the mouse to switch
set MSE_CH=0x00
rem MSE_ID = ID of the mouse (typically this maps to the order of mouse devices you see in the unifying software app in Advanced settings)
set MSE_ID=0x02

rem These typically don't change, but tap Apple menu->About This Mac->System Report->USB->USB Receiver for Logitech 
rem and make sure Product ID (RCVR_PID) and Vendor ID (RCVR_VID) are accurate 
set RCVR_VID=046D
set RCVR_PID=C52B


rem Switch MX Anywhere 3 to channel 1
.\hidapitester.exe --vidpid %RCVR_VID%:%RCVR_PID% --usage 0x0001 --usagePage 0xFF00 --open --length 7 --send-output 0x10,%MSE_ID%,0x0a,0x1b,%MSE_CH%,0x00,0x00

rem Switch MX Keys to channel 1
.\hidapitester.exe --vidpid %RCVR_VID%:%RCVR_PID% --usage 0x0001 --usagePage 0xFF00 --open --length 7 --send-output 0x10,%KYB_ID%,0x09,0x1e,%KYB_CH%,0x00,0x00
timeout /t 2
rem sending twice since when keyboard is sleeping, might need to wake up
.\hidapitester.exe --vidpid %RCVR_VID%:%RCVR_PID% --usage 0x0001 --usagePage 0xFF00 --open --length 7 --send-output 0x10,%KYB_ID%,0x09,0x1e,%KYB_CH%,0x00,0x00
