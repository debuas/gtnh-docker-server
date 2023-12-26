#!/bin/bash

# Check if the version is provided as an argument
if [ -z "$1" ]; then
    echo "Please provide a version as an argument."
    exit 1
fi

# Fetch the raw download list
raw_download_list=$(curl -s "http://downloads.gtnewhorizons.com/ServerPacks/?raw")

# Filter and select the right version with the non-Java8 version
selected_download=$(echo "$raw_download_list" | grep "/GT_New_Horizons_$1_Server_Java_[0-9]*-[0-9]*.zip" | grep -v "/betas/" | tail -n 1)

if [ -z "$selected_download" ]; then
    echo "No matching version found for $1."
    exit 1
fi

# Extract the filename from the URL
filename=$(basename "$selected_download")

# Download the selected zip file
echo "Downloading $selected_download..."
curl -O "$selected_download"

# Create the server directory if it doesn't exist
mkdir -p server

# Unpack the zip file into the "server" directory
echo "Unpacking $filename into 'server' directory..."
unzip "$filename" -d "server"

# Set eula.txt to true
echo "eula=true" > server/eula.txt

echo "Done."
exit 0
