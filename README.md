# Configs
My working environment configs. macOS specific. Tested in Monterey.

## Install

1. Install [Sublime Text Editor](https://www.sublimetext.com/download_thanks?target=mac) (it's used for editing settings)
1. Install Alacritty Terminal
    ```
    brew install --cask alacritty
    ```
1. Install JetBrains Fonts
    ```
    brew tap homebrew/cask-fonts
    brew install --cask font-jetbrains-mono
    ```
1. Clone configs
    ```
    git clone https://github.com/vyalovvldmr/configs.git /Users/$USER/.config
    ```
1. Copy git config
    ```
    cd /Users/$USER/.config
    cp git/.gitconfig ~/.gitconfig
    ```
