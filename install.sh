#!/bin/bash

# Version number of the speedtest-cli package
version=1.0.10

# Ask the user to input 1 or 2 to specify their CPU architecture
echo "Select your CPU architecture:"
echo "1. amd64"
echo "2. arm64"
read -p "Choice: " choice

# Check the user's choice and assign the corresponding value to the "architecture" variable
case $choice in
    1)
        architecture="amd64"
        ;;
    2)
        architecture="arm64"
        ;;
    *)
        echo "Invalid choice. Please input 1 or 2."
        exit 1
        ;;
esac

# Download the speedtest-cli package
wget "https://github.com/librespeed/speedtest-cli/releases/download/v${version}/librespeed-cli_${version}_linux_${architecture}.tar.gz"

# Extract the speedtest-cli package
gzip -d librespeed-cli_${version}_linux_${architecture}.tar.gz
tar xf librespeed-cli_${version}_linux_${architecture}.tar

# Move the executable to the /usr/bin/ directory
sudo mv librespeed-cli /usr/bin/

# Remove useless files
rm librespeed-cli_${version}_linux_${architecture}.tar
rm LICENSE
