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

# Install Firefox
brew install --cask firefox

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

# Install AltTab
brew install --cask alt-tab

# Install Raycast
brew install --cask raycast

# Install The Unarchiver
brew install --cask the-unarchiver

# Install Amethyst
brew install --cask amethyst

# Install Hammerspoon
brew install --cask hammerspoon
defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"

# Install Selfcontrol
brew install --cask selfcontrol

# Install Karabiner-Elements
brew install --cask karabiner-elements

# Install Slack
brew install --cask slack

# Install Spark Mail Client
brew install --cask readdle-spark

# Install Monitor Control
brew install --cask monitorcontrol

# Install Latest
brew install --cask latest

# Install PyCharm CE
brew install --cask pycharm-ce
