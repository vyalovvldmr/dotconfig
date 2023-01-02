# Configs
My working environment configs and install scripts. macOS and zsh specific. Tested in Monterey (early 2023).

## Install

1. Clone configs:
    ```
    git clone https://github.com/vyalovvldmr/configs.git /Users/$USER/.config
    ```
1. Install Homebrew:
    ```
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
1. The following command automates a fresh install of:
    - Sublime Text
    - zsh-autosuggestions
    - JetBrains fonts
    - Alacritty terminal
    - Zellij
    - Starship
    - Docker
    - Firefox Developer edition
    - KeePassXC
    
    using homebrew
    ```
    make install
    ```
1. Init git config:
    ```
    make init
    ```
