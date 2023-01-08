# Configs
My working environment configs and install scripts. macOS and zsh specific. Tested in Monterey (early 2023).

## Install

1. Clone configs:
    ```
    git clone https://github.com/vyalovvldmr/configs.git /Users/$USER/.config
    ```
1. Tweak macOS:
    ```
    make tweaks
    ```
1. Reboot system
1. The following command automates a fresh install of:

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

    using homebrew
    ```
    make install
    ```
1. Init git config:
    ```
    make init
    ```
