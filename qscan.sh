#!/bin/bash

read -r -p "ENTER IP= " IP

# DEFINE PORTS HERE------------

ports="-p0-25,80,111,443,445,554,1720-1730,3389,8080"

# Ensure the IP is provided
if [ -z "$IP" ]; then
  echo "IP address cannot be empty."
  exit 1
fi

clear

read -r -p "OUTPUT FILENAME= " OUT

# Check if output provided
if [ -z "$OUT" ]; then
    clear
    sudo masscan $ports --wait 1 "$IP"
    exit 1
fi

clear
sudo masscan $ports --wait 1 "$IP" -oL "$OUT"
