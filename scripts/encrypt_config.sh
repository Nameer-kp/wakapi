#!/bin/bash
gpg --symmetric --cipher-algo AES256 --output ../config.gpg ../config.default.yml

input_file="../config.gpg"
output_file="../config.base64"

# Check the operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
  base64 -i "$input_file" -o "$output_file"
elif [[ "$OSTYPE" == "linux"* ]]; then
  base64 -w 0 -i "$input_file" -o "$output_file"
else
  echo "Unsupported operating system: $OSTYPE"
  exit 1
fi

rm ../config.gpg


