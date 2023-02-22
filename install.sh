#!/usr/bin/env bash

set -exuo pipefail

script_dir=$(pwd)

cd ~

# This script is the last thing run during postCreate. You can set up more customization as long as you can script it here.

# Link from the original script directory into home.
ln -s "${script_dir}/packages.sh" .
ln -s "${script_dir}/aliases.sh" .

# Copy powershell profile
mkdir --parents /home/vscode/.config/powershell
cp "${script_dir}/profile.ps1" /home/vscode/.config/powershell/Microsoft.PowerShell_profile.ps1

# Feed script into rc file so it's picked up by every instance of zsh opened.
echo ". ${script_dir}/aliases.sh" >> .zshrc
echo "Finished installing aliases."

# Run script to install any packages.
./packages.sh
echo "Finished installing packages."