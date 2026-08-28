### 🏎️ SimHubDash + CrewChief for Le Mans Ultimate on Linux

Complete installation and configuration guide for **Le Mans Ultimate (LMU)**, **SimHubDash**, and **CrewChief** on Linux systems (focused on **CachyOS / Arch Linux** with **KDE Plasma**). 

This manual details how to achieve a native **triple-monitor setup (7680×1440 @ 144 Hz) under Wayland without using Gamescope**. 

### 📋 Prerequisites & Important Information

* **Environment:** Wayland + KDE Plasma.
* **Test Hardware:** 3 monitors @ 144 Hz (combined resolution of 7680×1440). *Note: Resolution and refresh rate values can be adapted to match your specific hardware.*
* **⚠️ Golden Rule:** To ensure proper communication and telemetry sharing between all applications, **Gamescope MUST NOT be used**.

### 🚀 Step 1: Core Component Installation

### 1. Preparing Le Mans Ultimate (LMU)

1. Install **Le Mans Ultimate** via Steam.
2. Launch it using the **Proton** version recommended for the current game release.
3. **⚠️ Very Important:** Use **only one monitor** for this initial setup.
4. Fully configure your steering wheel, pedals, button mappings, and any other controls.
5. Close the simulator once everything is configured.
6. Leave Steam *Launch Options* **completely empty** for now.

### 2. Software Downloads

Download the latest Windows installer releases for: 

* [SimHubDash](/goto?url=CAESPgHrOzAVbUqntCm1iSrPt42UdHfXomR7NlkUiDnGDFL9t15RiUvIA09j9IJzOvNzdBAXTAKrYc2RFpkeHgW3)
* [CrewChief](/goto?url=CAESPAHrOzAVnW_-zKYMu6xcpFq6p42dzqxCZ76Tt4JxJNN-FjMWCR5M28JDxpzDf599T0GBQr_TWpSQsnQP8Q)

### 3. Installation via Terminal

Open a terminal in the folder where you downloaded the installers and run the commands contained in the Install_Simhubdash_and_Crewchief.txt file provided in this repository. 

📝 **Note on paths:** Remember to update the Proton path/version and installer filenames in the commands to match the exact versions you are using. 

**During installation, make sure to follow these requirements:** 

* ❌ **CrewChief:** If the installer asks to run the application after setup, **uncheck the box**. Do not launch it yet.
* ❌ **SimHubDash:** Legally **uncheck** the following component checkboxes: 

  * Install .NET Runtime
  * Install USB Display Drivers
  * Install Visual C++ Redistributables
  * If it asks to run after installation, **uncheck the box**.

### 🛠️ Step 2: Launch Script & Telemetry Setup

### 1. Creating the Launch Script

Create a script file named launch_apps.sh (or any name you prefer) and paste inside it the contents of the Launch_Simhub_And_Crewchief.txt file from this repository. 

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
2. Replace its entire content with the text from the Config_DX11.txt file included in this repository.
3. *If your combined resolution is different from 7680×1440, only modify the lines corresponding to the resolution values.*

### 2. In-Game Configuration

1. Launch Le Mans Ultimate.
2. Go to video settings and configure **only**: 

  * Screen resolution.
  * Enable the **Multiview** checkbox.
3. Restart the simulator.

### 3. Troubleshooting Window Issues (If LMU only spans 2 monitors)

If the game does not automatically span across all three displays, we will create a native window rule in KDE Plasma: 

1. While LMU is running, open: System Settings ➡️ Window Management ➡️ Window Rules.
2. Create a new rule and target the active LMU window.
3. Configure it by replicating the parameters shown in the window_rule.png image in this repository. 

  * *Note: The default window position is usually 0,0. If you use top auxiliary screens (like a 4th monitor), adjust the Y axis value accordingly (e.g., 0,1080).*
4. Apply changes, close the simulator, and launch it again. It should now span correctly.

### 4. Final Views and Refresh Rate Adjustments

1. Enter a track session and adjust your FOV, triple-screen physical alignment, and angles using the in-game menus. Close LMU.
2. Open Config_DX11.ini again to verify that the refresh rate matches your monitors exactly (e.g., 144, 120, etc.). Save the file.

### 🕹️ Steam Launch Options

Below is an optimized launch command example that works reliably. You can adjust individual environment flags depending on your graphics hardware (AMD/Nvidia): 

bash

PROTON_USE_NTSYNC=1 PROTON_FSR4_UPGRADE=1 PROTON_ENABLE_HDR=1 PROTON_ENABLE_WAYLAND=1 RADV_PERFMODE=high DXVK_ASYNC=1 renice -n -10 -p $(pgrep -u $USER le_mans_ultimate) 2>/dev/null; %command%

Usa el código con precaución.

*Remember that the key takeaway is keeping the native Wayland environment active and explicitly avoiding tools like Gamescope.* 

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

* 🔗 [Original Guide: LMU Linux Triples (Gist by srlemke)](/goto?url=CAESYwHrOzAVwYiym1CFvr7kwIKQJbi2qebSk9T_bCPkA560sdYRubgsebqLDDb_CN1x_BJkM4uJBlSKWJIW-jm0Drvlsco8wBMBoa0_XfBy7DG7bZFb9w6cbrOvC6mjnXeOoBZ4Fg)
* 🔗 [Full collection of Linux sim racing optimizations and scripts by srlemke](/goto?url=CAESQgHrOzAVTIz-5oW-OesUPvEz-zNk0hOQ9yXzkNoo4U5zEtVPG6SIeZH_L1SFrddw7ySJjLh52FeIntQUrmj_cJmfpw)

🏁 **See you on track! Enjoy your Linux-powered simulator.**
