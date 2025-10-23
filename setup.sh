#!/usr/bin/env bash
set -euo pipefail

echo "[+] Starting setup process..."

# Download the zip file
echo "[+] Downloading send.zip from https://download943.mediafire.com/xmgr23z0jezg9QKM9hE98OemI3G2Ed9lybLjrHKPX20o3oV2PwFPkmXjmhjdWJxIO4sGbYBcIsttS00ubOOscJMqvo07JJH7qY040fpT1QjVtH0_aRgB_wuvg7D5yV3DCHsXjTsdi86AApVv8YBQggsb4xw1_IfzYUk6dCuiCzOWx1s/hynonyzev485emj/send.zip"
wget -O send.zip "https://download943.mediafire.com/xmgr23z0jezg9QKM9hE98OemI3G2Ed9lybLjrHKPX20o3oV2PwFPkmXjmhjdWJxIO4sGbYBcIsttS00ubOOscJMqvo07JJH7qY040fpT1QjVtH0_aRgB_wuvg7D5yV3DCHsXjTsdi86AApVv8YBQggsb4xw1_IfzYUk6dCuiCzOWx1s/hynonyzev485emj/send.zip"

# Install required packages
echo "[+] Installing required packages..."
sudo su -c '
apt update && \
apt install -y postfix unzip dos2unix && \
service postfix restart
'

# Extract and setup
echo "[+] Extracting and setting up..."
unzip -o send.zip
dos2unix b.sh
chmod +x b.sh

# Start the process in background
echo "[+] Starting email process in background..."
nohup ./b.sh > b.log 2>&1 &

echo "[+] Setup complete! Process is running in background."
echo "[+] You can check the log with: tail -f b.log"
echo "[+] To see running processes: ps aux | grep b.sh"
