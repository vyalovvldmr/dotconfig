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
    - zellij
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
    - Amethyst
    - Hammerspoon
    - Selfcontrol
    - Karabiner-Elements
    - Slack
    - Spark Mail Client
    - Monitor Control
    - Latest
    - PyCharm CE
    <br/><br/>
    ```
    make install
    ```
1. Init git config:
    ```
    make init
    ```

## Checklist

- Turn off Spotlight indexing `Siri & Spotlight` -> `Spotlight privacy` drag&drop Macintosh HD
- Deactivate Spotlight hotkeys `Keyboard` -> `Keyboard shortcuts` -> `Spotlight`
- Activate Raycast hotkey
- Use capslock for switching input sources `Keyboard` -> `Input Sources` -> `Edit`
- Open AltTab, Amethyst, Karabiner-Elements, Monitor Control, Raycast, Hammerspoon and grant access in `Privacy & Security`
