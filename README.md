# Pensato - VR controller for Ableton Live

## Software Requirements:
--* Ableton Live (30 day trial available)[https://www.ableton.com/en/trial/]
--* (Python 2.7)[https://www.python.org/downloads/release/python-2710/]
--* (optional) (LoopMidi)[http://www.tobias-erichsen.de/software/loopmidi.html]
--* Showtime-Live (included in download)

## Hardware Requirements
--* Oculus Rift DK2
--* Leap Motion with VR mount

## Installation Instructions
1.  Install Python 2.7
2.  Extract pensato.zip to a location of your choice.
3.  Open up a command prompt and navigate to the Showtime-Python folder inside where you extracted pensato.zip. Run the command python setup.py install to download the necessary Python libraries and install the server. 
4.  The install script should copy some Python scripts into your Ableton Live folder, but if you have Live installed in a non-default location (C:\ProgramData\Ableton is the default), then copy the folder contents of Showtime_Live/Midi_Remote_Scripts to your Ableton Live Midi Remote Script directoy. Ableton have provided some handy instructions (here.)[https://www.ableton.com/en/articles/install-third-party-remote-script/]
5.  (Optional) If you are using LoopMIDI (used to increase the speed of communication between Live and Pensato) then start the program now.
6.  Run the LiveShowtimeClient.py server located at [Python_Installation_Directory]/Scripts/LiveShowtimeClient.py. Eg: C:\Python27\Scripts\LiveShowtimeClient.py
7.  (Optional) If you are using LoopMIDI then make sure to run the script with the flag --m 1 or the appropriate index for the LoopMIDI port. Eg: LiveShowtimeClient.py --m 1
8.  Start Ableton Live and go to Options->Preferences->MIDI/Sync. Set one of the control surfaces to "ShowtimeBridge". If ShowtimeBridge does not show up in the list of Control Surface scripts then make sure you have followed steps 3 and/or 4. The LiveShowtimeClient console should display some messages about registered methods.
9.  (Optional) If using LoopMIDI then set input to "loopMIDI Port" and set track, sync and remote to ON in the midi port section .
10.  Open the Ableton Live set that you wish to control with Pensato. A demo set is provided inside the "Ableton_pensato_demo" folder.
11.  If running Ableton Live on a separate computer rather than the VR machine, then edit config.json to point to the hostname or IP of the machine running the LiveShowtimeClient server and Ableton Live. Localhost is the default value.
12.  Run pensato.exe.

## Operating instructions
When entering Pensato, the orbs on the plinth in front of you will display all the clips and devices from an Ableton Live track when pressed.
The square buttons that appear above the orbs will trigger clips.
The sliders control instrument and effect device parameters. The up and down arrow buttons at the bottom of the device will scroll through more parameters.
If you add or remove tracks, clips or devices from Ableton Live whilst Pensato is running, you will need to restart Pensato in order to resync with Live's workspace.
Press R to recent the camera.
Press Esc to quit.
