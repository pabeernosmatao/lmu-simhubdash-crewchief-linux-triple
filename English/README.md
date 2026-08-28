### 🏎️ Full Installation Guide: SimHubDash + CrewChief for Le Mans Ultimate on Linux

This guide provides a step-by-step walkthrough to install and configure **Le Mans Ultimate (LMU)**, **SimHubDash**, and **CrewChief** on Linux systems (focused on **CachyOS / Arch Linux** with **KDE Plasma**). 

You will learn how to achieve a native **triple-monitor setup (7680×1440 @ 144 Hz) under Wayland without using Gamescope**. 

### 📋 Prerequisites & Important Information

* **Environment:** Wayland + KDE Plasma.
* **Test Hardware:** 3 monitors @ 144 Hz (combined resolution of 7680×1440). *Note: Resolution and refresh rate values can be adapted to match your specific hardware.*
* **⚠️ Golden Rule:** To ensure proper communication and telemetry sharing between all applications, **Gamescope MUST NOT be used**.

### 🚀 Step 1: Core Component Installation

### 1. Preparing Le Mans Ultimate (LMU)

1. Install **Le Mans Ultimate** via Steam.
2. Launch it using the **Proton** version recommended for the current game release.
3. **⚠️ Very Important:** Use **only one monitor** for this initial setup (you may have multiple monitors connected, but do not attempt triple-screen configuration yet).
4. Fully configure your steering wheel, pedals, button mappings, and any other controls.
5. Close the simulator once everything is configured.
6. Leave Steam *Launch Options* **completely empty** for now.

### 2. Software Downloads

Download the latest Windows installer releases for: 

* [SimHubDash](/goto?url=CAESPgHrOzAVveVn29kPKq6F0OlrXsYTDUu8MlkTa0nGt8GGu8xhfAi3o_ZaYFxuLa7OLfhtN6UB-82-Q_8npxTp)
* [CrewChief](/goto?url=CAESPAHrOzAVNBFkOxSewY2NZi4gRL97RSaJB3qvRL2-kgg9ji_pOtTtByzP1toZggpHrGgDgNFVtNOali5fpA)

Open a terminal in the folder where you downloaded the installers and run the commands contained in the Install_Simhubdash_and_Crewchief.txt file located in the root of this repository. 

📝 **Note on paths:** Remember to update the Proton path/version and installer filenames in the commands to match the exact versions you are using. 

**During installation, make sure to follow these requirements:** 

* ❌ **CrewChief:** If the installer asks to run the application after setup, **uncheck the box**. Do not launch it yet.
* ❌ **SimHubDash:** Uncheck the following component checkboxes: 

  * Install .NET Runtime
  * Install USB Display Drivers
  * Install Visual C++ Redistributables
  * If it asks to run after installation, **uncheck the box**.

### 🛠️ Step 2: Launch Script & Telemetry Setup

### 1. Creating the Launch Script

Create a script file named launch_apps.sh (or any name you prefer) and paste inside it the contents of the Launch_Simhub_And_Crewchief.txt file from the root of this repository. 

* Make it executable via terminal (chmod +x launch_apps.sh).
* Remember to check and update the Proton path inside the script if necessary.

### 2. First-Time Telemetry Initialization

1. Run your script (./launch_apps.sh). Both applications should start correctly.
2. Configure the telemetry plugins within each application interface.
3. **If telemetry detection fails:** Close both applications and follow the **Alternative Step (6b)**: 

  * With both SimHub and CrewChief closed, launch LMU from Steam.
  * Once the simulator is running, execute the launch script.
  * Reconfigure the telemetry plugins in SimHubDash and CrewChief.
4. Once you verify telemetry is working, close everything in this strict order: **SimHub/CrewChief ➡️ Le Mans Ultimate**.

📝 *Note:* Telemetry activation can be somewhat inconsistent. It usually works with the simulator closed (Step 2.1), but sometimes it only works when LMU is already running (Step 2.2). If it does not work on the first try, keep trying—it will eventually connect correctly. 

### 3. Firewall Configuration

To allow SimHubDash to communicate with external tablets, smartphones, or dash screens over your local network: 

* Open TCP port **8888** in your firewall.
* On *KDE Plasma*, you can manage this graphically via: System Settings ➡️ Firewall.

💡 **Single-Monitor Users:** If you play on a single display, you can skip directly to the [Steam Launch Options](#-steam-launch-options) section. 

### 🖥️🖥️🖥️ Step 3: Triple Monitor Configuration (Wayland, No Gamescope)

### 1. Replacing the LMU Configuration File

1. Locate the original configuration file at the following path: 

bash

/home/YOUR_USER/.steam/steam/steamapps/common/Le Mans Ultimate/UserData/Config_DX11.ini

Usa el código con precaución.
2. Replace its entire content with the text from the Config_DX11.txt file included in the root of this repository.
3. *If your combined resolution is different from 7680×1440, only modify the lines corresponding to the resolution values and leave everything else unchanged for now.*

### 2. In-Game Configuration

1. Launch Le Mans Ultimate.
2. Go to video settings and configure **only**: 

  * Screen resolution.
  * Enable the **Multiview** checkbox.
3. Restart the simulator.

### 3. Troubleshooting Window Issues (If LMU only spans 2 monitors)

If LMU correctly spans all three monitors, continue to the next step. If the game does not automatically span across all three displays and only covers two, we will create a native window rule in KDE Plasma: 

1. While LMU is running, open: System Settings ➡️ Window Management ➡️ Window Rules.
2. Create a new rule and target the active LMU window.
3. Configure it by replicating the parameters shown in the window_rule.png image in this repository. 

  * *Note: Window position may differ from the example. The default window position is usually 0,0. In my setup it is 0,1080 because I use a fourth monitor above the triple-screen setup. Depending on your layout, adjust this value.*
4. Apply changes, close the simulator, and launch it again. It should now span correctly across all three displays.

### 4. Final Views and Refresh Rate Adjustments

1. Enter a track session and adjust your FOV, triple-screen physical alignment, and angles using the in-game menus. Close LMU.
2. Open Config_DX11.ini again to verify that the refresh rate matches your monitors exactly (e.g., 144, 120, etc.). If needed, adjust it and save the file.

### 🕹️ Steam Launch Options

Below is an optimized launch command example that works reliably. You can adjust individual environment flags depending on your graphics hardware (AMD/Nvidia): 

bash

PROTON_USE_NTSYNC=1 PROTON_FSR4_UPGRADE=1 PROTON_ENABLE_HDR=1 PROTON_ENABLE_WAYLAND=1 RADV_PERFMODE=high DXVK_ASYNC=1 renice -n -10 -p $(pgrep -u $USER le_mans_ultimate) 2>/dev/null; %command%

Usa el código con precaución.

*Remember that the key takeaway is keeping the native Wayland environment active and explicitly avoiding tools like Gamescope to ensure all applications can talk to each other.* 

### 🔄 Recommended Workflow (Execution Order)

To prevent telemetry packet drops or software crashes, always follow this startup and shutdown sequence consistently: 

### On Startup:

1. 🟩 Launch **Le Mans Ultimate** from Steam.
2. 🟩 Run your **launch script** (launch_apps.sh) to start SimHubDash and CrewChief.

### On Shutdown:

1. 🟥 Close **SimHubDash** and **CrewChief** (the order between them does not matter).
2. 🟥 Close **Le Mans Ultimate**.

### 📝 Compatibility & Hardware Notes

* 🎙️ **CrewChief:** Works flawlessly except for voice microphone commands and the personalized feature where the spotter addresses you by your real name.
* 📊 **SimHubDash:** 100% operational support for external dashboards, overlays, telemetry recording, and custom display elements.
* 🔊 **Next Level Racing HF8 (Haptic Pad):** Functions correctly but **must be configured as an audio output device** inside SimHub's *ShakeIt Bass Shakers* section. USB connectivity has not been successfully established in this Linux environment.

### 🤝 Acknowledgements

This manual and its configuration assets were made possible thanks to the excellent technical research previously shared by **srlemke**. The solution to span three displays under Wayland without relying on Gamescope directly adapts their original scripts and technical guide. 

* 🔗 [Original Guide: LMU Linux Triples (Gist by srlemke)](/goto?url=CAESYwHrOzAVM-XcGfxFIc47O6P6clQ2p0hyP4TQ79jVNc3HZV7J9M9rKKaw9_ePtmY_Z_GdnCpSUnPZx-wdSgGyLdPDU8_1oIby0RnsU1ydYSFB9pNZQNSBgxUwVlGVqNzVcex9qQ)
* 🔗 [Full collection of Linux sim racing optimizations and scripts by srlemke](/goto?url=CAESQgHrOzAVpultWfS67mZbz_1NAyycVjhnki9ZYzIILdciQz3kvdNvb8GPWKlKIYIxNV4TahMT-1qbhxLAnSIPoDUQNg)

🏁 **See you on track! Enjoy your Linux-powered simulator.**
