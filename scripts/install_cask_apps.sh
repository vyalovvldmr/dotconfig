#!/bin/bash

set -Eeu pipefail

eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing cask apps..."

# Install Sublime Text
brew install --cask sublime-text

# Install Meslo Nerd font
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

# Install Kitty
brew install --cask kitty

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
open -a alttab

# Install Raycast
brew install --cask raycast
open -a raycast

# Install The Unarchiver
brew install --cask the-unarchiver

# Install Yabai
brew install koekeishiya/formulae/yabai
brew services start koekeishiya/formulae/yabai

# Install Hammerspoon
brew install --cask hammerspoon
defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
open -a hammerspoon

# Install Selfcontrol
brew install --cask selfcontrol

# Install Karabiner-Elements
brew install --cask karabiner-elements
open -a karabiner-elements

# Install Slack
brew install --cask slack

# Install Spark Mail Client
brew install --cask readdle-spark

# Install Monitor Control
brew install --cask monitorcontrol
open -a monitorcontrol

# Install Latest
brew install --cask latest

# Install PyCharm
brew install --cask pycharm

# Install DevToys
brew install --cask devtoys

# Install Docker
brew install --cask docker

# Install Visual Studio Code
brew install --cask visual-studio-code
