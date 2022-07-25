# logiSwitch

## Note

This repository contains scripts to allow switch 2 logitech devices from one computer to another. Both devices and computers **must use the logitech unifying dongle**. Connectiong via bluetooth did not work through my tests.

It is heavily based on this repository : https://github.com/marcelhoffs/input-switcher

It also use hidapitester to send the command. It is provided in the repo, but you can get latests version here : https://github.com/todbot/hidapitester/releases

The purpose is to assign, on both OS, the script to a key / mouse button, so that chen it will be used, both devices switch to the other computer.

In my case, I switch from one windows computer (Windows 10) to a Mac, and vice versa.

As a sample, the script is binded to the MX MAster 3 small button on the side : 


## Windows

Windows configuration consists in 2 components : 
* a batch script that "does" the switch
* hidapitester binary for windows


## Mac

Mac configuration consists in 3 components :
* a bash script that "does" the switch
* an apple script that will encapsulate the script into an app, so that you can assign it in logitech options / options+ .It is not provided since you will have to create your own.
* hidapitester binary for macOS


To create the applescript, simply : 
* open applescripteditor, and create a new script
* paste the following command (adapt to where you stored the files) : 

’’ applescript
do shell script "bash /Applications/logiSwitch/logiSwitch.sh"
’’

### Adapting the scripts

You will have to adapt the scripts depending on your setup.

Mainly, you have to identify 2 things (on each computer) for each device  :
* channel corresponding to the device you want to go to from current computer - MSE_CH / KYB_CH - 0x00 for channel 1, 0x01 for channel 2, 0x02 for channel 3
* id of the device - MSE_ID / KYB_ID - it depends on the order you set up your device to the unifying receiver : 0x01 for the first device , 0x02 for the second device , adn so on . The order seems to be reflected in LogiOptions / logiOptions +

LAst thing, the scripts provided suppose that you have the following devices : 
* an MX keyboard (C value = 0x09)
* an MX Master 3 mouse (C value = 0x0a)

If you have other device, you will have to change "C" value also in the scripts.
If you have other devices, you have to figure out their value.



## Resources and thanks

* @marcelhoffs for the original scripts
* @todbot for hidapister
* every one who gave informations in this issue : https://github.com/Logitech/logi_craft_sdk/issues/28 


## License

As of Dec 01 2018, Nicolas Dujardin has released this repository and its contents to the public domain.

It has been released under the [UNLICENSE][].

[unlicense]: LICENSE