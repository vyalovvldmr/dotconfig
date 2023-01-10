#!/bin/bash

set -Eeu pipefail

eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing cask apps..."

# Install Sublime Text
brew install --cask sublime-text

# Install Meslo Nerd font
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

# Install Alacritty Terminal
brew install --cask alacritty

# Install Docker
brew install --cask docker
open /Applications/Docker.app

# Install Firefox Developer edition
brew tap homebrew/cask-versions
brew install --cask firefox-developer-edition

# Install KeePassXC
brew install --cask keepassxc

# Install Telegram
brew install --cask telegram

# Install Obsidian
brew install --cask obsidian

# Install IINA
brew install --cask iina

# Install Hiddenbar
brew install --cask hiddenbar

# Install Maccy
brew install --cask maccy

# Install AltTab
brew install --cask alt-tab

# Install Raycast
brew install --cask raycast

# Install The Unarchiver
brew install --cask the-unarchiver
