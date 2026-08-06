#!/bin/bash
# Setting up the environment using your special Proton required
export STEAM_COMPAT_DATA_PATH="$HOME/.local/share/Steam/steamapps/compatdata/2399420"
export PROTON_PATH="$HOME/.local/share/Steam/compatibilitytools.d/GE-Proton10-34-LMU-hid_fixes"
export WINEPREFIX="$STEAM_COMPAT_DATA_PATH/pfx"
export WINEDEBUG="-all" # Limit unnecessary text in the terminal

echo "Getting tools ready for Le Mans Ultimate..."

# 1. We launched SimHub using Wine directly in the background (&)
"$PROTON_PATH/files/bin/wine" "$STEAM_COMPAT_DATA_PATH/pfx/drive_c/Program Files (x86)/SimHub/SimHubWPF.exe" &

# 5 second pause to give Wine time to process the first boot
sleep 5

# 2. We launched CrewChief using Wine directly in the background (&)
"$PROTON_PATH/files/bin/wine" "$STEAM_COMPAT_DATA_PATH/pfx/drive_c/Program Files (x86)/Britton IT Ltd/CrewChiefV4/CrewChiefV4.exe" &

echo "¡SimHub and CrewChief successfully launched!"
