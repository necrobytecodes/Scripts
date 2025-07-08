#!/bin/bash
set -e

echo "Installing Streamio..."

# Install flatpak if not already installed
if ! command -v flatpak &> /dev/null; then
  echo "Flatpak not found, installing..."
  sudo apt update
  sudo apt install flatpak -y
else
  echo "Flatpak already installed."
fi

# Add Flathub repo if missing
if ! flatpak remote-list | grep -q flathub; then
  echo "Adding Flathub repository..."
  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
else
  echo "Flathub repository already exists."
fi

echo "Updating Flatpak repositories..."
flatpak update -y

echo "Installing Streamio flatpak..."
flatpak install flathub io.streamio.Streamio -y

echo "Streamio installation complete!"
# Check if Streamio is installed
if ! flatpak list | grep -q io.streamio.Streamio; then
  echo "Streamio installation failed. Please check the installation instructions."
  exit 1
fi

echo "Streamio is successfully installed and ready to use!"
echo " "
echo "torrentio has not been installed yet, please go to https://torrentio.strem.fun/configure to install it."
echo " "
echo "You can run Streamio using the command: flatpak run io.streamio.Streamio"
echo "Or you can find it in your application menu."
echo " "
echo "Enjoy your streaming experience with Streamio!"
exit

read -p "Do you want to open the torrentio website?(y/n) : " choice
case "$choice" in
  y|Y ) xdg-open "https://torrentio.strem.fun/configure";;
  n|N ) echo ""
  * ) echo "Invalid input. Please enter y or n."; exit 1;;
esac

read -p "Do you want to reboot? (y/n): " choice
case "$choice" in
  y|Y ) reboot
  n|N ) echo "Exiting..."; exit 1;;
  * ) echo "Invalid input. Please enter y or n."; exit 1;;
esac