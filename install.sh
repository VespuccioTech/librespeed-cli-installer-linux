#!/bin/bash

# Version number of the speedtest-cli package
version=1.0.10

# Check system architecture
if [ "$(uname -m)" = "x86_64" ]; then
    architecture="amd64"
elif [ "$(uname -m)" = "aarch64" ]; then
    architecture="arm64"
else
    exit 1
fi

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
