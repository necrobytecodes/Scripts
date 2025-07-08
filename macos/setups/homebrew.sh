#!/bin/bash
set -e

echo "Checking for Homebrew..."

if ! command -v brew &> /dev/null; then
  echo "Homebrew not found, installing..."
  
  # Install Homebrew (works for macOS and Linux)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sleep 2
    echo "Homebrew installation complete."
    sleep 2

    echo "Adding homebrew to PATH..."
    sleep 2
  # Add Homebrew to PATH for the current session
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bash_profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  else
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

else
  echo "Homebrew is already installed."
fi

echo "Updating Homebrew..."
brew update
sleep 2

echo "Homebrew setup and package installation complete!"
sleep 2
clear
echo "Run brew help for more information on using Homebrew."