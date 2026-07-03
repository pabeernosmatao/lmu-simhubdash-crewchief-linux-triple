# LMU Linux Triple Monitor Guide (EN)

Installing Le Mans Ultimate, SimHubDash and CrewChief
1. Install Le Mans Ultimate
Install Le Mans Ultimate via Steam and launch it using the Proton version recommended for the current game release.
Before continuing:
    • Use only one monitor for the initial setup (you may have multiple monitors connected, but do not attempt triple-screen configuration yet). 
    • Configure your steering wheel, pedals, button mappings, and any other controls. 
    • Close the simulator once everything is configured. 
    • Leave Steam Launch Options completely empty for now. 

2. Download the latest versions
Download the latest releases of:
    • SimHubDash 
    • CrewChief 

3. Open a terminal
Navigate to the folder where you downloaded the installers.

4. Install SimHubDash and CrewChief
Run the commands contained in Install_Simhubdash_and_Crewchief.txt.
Important: Update the Proton path/version and the installer filenames for SimHubDash and CrewChief to match the versions you are using.
- Crewchief: After install do not run it if the installer asks
- Simhubdash Uncheck - Install .NET Runtime
                     - Install USB Display Drivers
                     - Install Visual C++ Redistributables      
                     - After install do not run it if the installer asks

6. Create the launch script
Create a script named xxxx.sh using the contents of Launch_Simhub_And_Crewchief.txt.
Save it wherever you prefer and make it executable.
Remember to update the Proton path if necessary.

7. Launch SimHubDash and CrewChief
Run xxxx.sh.
Both applications should start correctly.
Configure the telemetry plugins in each application.
If either application fails to detect or configure telemetry, close both programs.

6b. If telemetry still does not work
With both applications closed:
    1. Launch Le Mans Ultimate from Steam. 
    2. Once the simulator is running, execute xxxx.sh. 
    3. Reconfigure the telemetry plugins in SimHubDash and CrewChief. 
Once telemetry is working correctly, close everything in this order:
    1. Close SimHubDash and CrewChief. 
    2. Close Le Mans Ultimate. 
Note: Telemetry activation can be somewhat inconsistent. In my experience, it usually works with the simulator closed (Step 6), but sometimes it only works when LMU is already running (Step 6b). If it does not work on the first try, keep trying—it will eventually connect correctly.

7. Allow SimHubDash through the firewall
To allow SimHubDash to communicate with tablets and mobile devices, open TCP port 8888 in your firewall.
On KDE Plasma, firewall settings are available directly in System Settings.

8. Verify everything is working correctly
Always launch and close applications in the same order.
Startup
    1. Launch Le Mans Ultimate from Steam. 
    2. Run the launch script. 
Shutdown
    1. Close SimHubDash and CrewChief (either order is fine). 
    2. Close Le Mans Ultimate. 

9. Single-monitor users
If you only use one monitor, you can skip directly to the Steam Launch Options section.

Notes
In my experience:
    • CrewChief works correctly, except for voice commands and the option to address you by name. 
    • SimHubDash works correctly for dashboards, overlays, telemetry, and other display elements. 
    • The Next Level Racing HF8 haptic system also works, but must be configured as an audio output device inside ShakeIt Bass Shakers. I have not been able to get it working via USB. 

Triple Monitor Configuration (Wayland, No Gamescope)
1. Download Config_DX11.txt

2. Edit the configuration file
Go to:
/home/YOUR_USER/.steam/steam/steamapps/common/Le Mans Ultimate/UserData/
Open Config_DX11.ini, replace its entire content with Config_DX11.txt, and save the file.
If your setup is not 7680×1440, only modify the resolution values.
Leave everything else unchanged for now.

3. Configure LMU
Launch Le Mans Ultimate.
Configure only:
    • Screen resolution 
    • Enable Multiview 
Restart the simulator.

4. Check display output
If LMU correctly spans all three monitors, continue to Step 6.

4b. If LMU only spans two monitors
Continue to Step 5.

5. Create a KDE Plasma window rule
While LMU is running:
    • Open System Settings → Window Management → Window Rules 
    • Create a new rule 
    • Select the LMU window 
    • Configure it using the settings shown in window_rule.png 
Note: Window position may differ from the example. In my setup it is 0,1080 because I use a fourth monitor above the triple-screen setup. Depending on your layout, it may be 0,0 or something different.
Apply changes.
Close LMU and launch it again.
It should now correctly span all three displays.

6. Adjust in-game view
Enter a session and adjust:
    • Triple-screen alignment 
    • FOV 
    • Any other display settings 
Then close LMU.

7. Check refresh rate
Go to:
/home/YOUR_USER/.steam/steam/steamapps/common/Le Mans Ultimate/UserData/
Open Config_DX11.ini and verify the refresh rate is correct.
If needed, adjust it to match your monitors (144 Hz, 120 Hz, etc.) and save the file.

8. Final verification
Always use this startup sequence.
Startup
    1. Launch LMU from Steam 
    2. Run the launch script 
Shutdown
    1. Close SimHubDash and CrewChief (either order) 
    2. Close LMU 

9. Do not use Gamescope
Do not use Gamescope with this setup.

Steam Launch Options
Important
To ensure proper communication between all applications, Gamescope must not be used.
Below is a Steam launch command that works on my system.
It is provided as an example and may not be optimal for your hardware:

PROTON_USE_NTSYNC=1 PROTON_FSR4_UPGRADE=1 PROTON_ENABLE_HDR=1 PROTON_ENABLE_WAYLAND=1 RADV_PERFMODE=high DXVK_ASYNC=1 renice -n -10 -p $(pgrep -u $USER le_mans_ultimate) 2>/dev/null; %command%

You can use it as a starting point or ask for a hardware-specific configuration.
Just make sure you explicitly avoid using Gamescope.
If you need more FPS, you can install lsfg-vk, but that is outside the scope of this guide.

Acknowledgements
This guide was made possible thanks to the excellent work of srlemke and their Linux guides for Le Mans Ultimate.
The triple-monitor configuration without Gamescope is based on their original LMU Linux Triples setup, adapted for Wayland and KDE Plasma.
Original guide:
https://gist.github.com/srlemke/a9a8273dc66230a3dc36d8bd425186fc
Full collection of related Linux sim racing guides and scripts:
https://gist.github.com/srlemke

ENJOY YOUR SIMULATOR!
