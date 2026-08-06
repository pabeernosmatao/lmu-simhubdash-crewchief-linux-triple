#!/bin/bash
# Configuración del entorno usando tu Proton especial obligatorio
export STEAM_COMPAT_DATA_PATH="$HOME/.local/share/Steam/steamapps/compatdata/2399420"
export PROTON_PATH="$HOME/.local/share/Steam/compatibilitytools.d/GE-Proton10-34-LMU-hid_fixes"
export WINEPREFIX="$STEAM_COMPAT_DATA_PATH/pfx"
export WINEDEBUG="-all" # Limita textos innecesarios en la terminal

echo "Arrancando herramientas para Le Mans Ultimate..."

# 2. Lanzamos CrewChief usando el Wine directo en segundo plano (&)
"$PROTON_PATH/files/bin/wine" "$STEAM_COMPAT_DATA_PATH/pfx/drive_c/LMUFFB/LMUFFB.exe" &
