#!/bin/bash

read -r -p "ENTER IP= " IP

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
    sudo masscan -p20-25,80,443,445,3389,8080 --wait 0 "$IP"
    exit 1
fi

clear
sudo masscan -p20-25,80,443,445,3389,8080 --wait 0 "$IP" -oL "$OUT"