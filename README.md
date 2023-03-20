# Configs
My working environment configs and install scripts. macOS and zsh specific. Tested in Monterey and Ventura.

## Install

1. Clone configs:
    ```
    git clone https://github.com/vyalovvldmr/dotconfig.git /Users/$USER/.config
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
    - starship
    - neovim
    - htop
    - pyenv
    - rustup
    - unar
    - mc
    - nmap
    - jq
    - xh
    - pgcli
    - exa
    - bat
    - fd
    - cheat
    - duf
    - dua
    - zoxide
    - entr
    - fzf
    - telnet
    - scc
    - gnu-sed

    cask apps
    - Sublime Text
    - Meslo Nerd font
    - Alacritty terminal
    - Firefox
    - KeePassXC
    - Obsidian
    - IINA
    - Hiddenbar
    - AltTab
    - Raycast
    - The Unarchiver
    - Yabai
    - Hammerspoon
    - Selfcontrol
    - Karabiner-Elements
    - Slack
    - Spark Mail Client
    - Monitor Control
    - Latest
    - PyCharm
    - DevToys
    - Docker
    <br/><br/>
    ```
    make install
    ```
1. Init git config:
    ```
    make init
    ```

## Checklist

- Turn on tap to click `Trackpad` -> `Tap to click`
- Turn on three fingers drag&drop `Accessibility` `Pointer Control` -> `Trackpad Options` -> `Dragging Style`
- Use the Caps Lock to switch input sources `Keyboard` -> `Input Sources` -> `Edit`
- Prevent automatic sleeping on power adapter when the display is off `Displays` -> `Advanced`
- Turn off Spotlight indexing `Siri & Spotlight` -> `Spotlight privacy` drag&drop Macintosh HD
- Deactivate Spotlight hotkeys `Keyboard` -> `Keyboard shortcuts` -> `Spotlight`
- Install [Dev Tools X](https://github.com/fosslife/devtools-x) if needed
