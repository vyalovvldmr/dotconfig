# Configs
My working environment configs and install scripts. macOS and zsh specific. Tested in Monterey 12.6.2.

## Install

1. Clone configs:
    ```
    git clone https://github.com/vyalovvldmr/configs.git /Users/$USER/.config
    cd ~/.config
    ```
1. Tweak macOS (tweaks may potentially harm your system, run them at your own risk):
    ```
    make tweaks
    ```
1. Reboot system
1. The following command automates an installation of applications using homebrew:

    cli apps
    - homebrew
    - zsh-autosuggestions
    - zellij
    - starship
    - neovim
    - htop
    - pyenv
    - rustup

    cask apps
    - Sublime Text
    - Meslo Nerd font
    - Alacritty terminal
    - Docker
    - Firefox Developer edition
    - KeePassXC
    - Obsidian
    - VLC
    - Hiddenbar
    - Maccy

    ```
    make install
    ```
1. Init git config:
    ```
    make init
    ```

