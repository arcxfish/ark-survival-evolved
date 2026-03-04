#!/bin/bash

STEAMCMD="/steamcmd/steamcmd.sh"
INSTALL_DIR="/home/ubuntu/resource"
ARK_BIN="$INSTALL_DIR/ShooterGame/Binaries/Linux/ShooterGameServer"

echo "--- Checking for updates ---"
$STEAMCMD +force_install_dir "$INSTALL_DIR" +login anonymous +app_update 376030 validate +quit

echo "--- Starting ARK Server ---"
exec "$ARK_BIN" "TheIsland?listen?SessionName=iTL_Server_on_GALLERIA_v2" -server -log -NoBattlEye