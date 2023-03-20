#!/bin/bash

set -Eeu pipefail

eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing cli apps..."

# Install zsh-autosuggestions
brew install zsh-autosuggestions
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "export LC_ALL=en_US.UTF-8" >> ~/.zshrc
echo "export LANG=en_US.UTF-8" >> ~/.zshrc

# Install zsh-history-substring-search
brew install zsh-history-substring-search
echo "source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh" >> ~/.zshrc
echo "bindkey '^[[A' history-substring-search-up" >> ~/.zshrc
echo "bindkey '^[[B' history-substring-search-down" >> ~/.zshrc

# Install Starship
brew install starship
echo "eval \"$(starship init zsh)\"" >> ~/.zshrc

# Install neovim
brew install neovim
echo "alias vi=/opt/homebrew/bin/nvim" >> ~/.zshrc

# Install htop
brew install htop
echo "alias htop=\"sudo htop\"" >> ~/.zshrc

# Install pyenv
brew install pyenv
echo "PATH=\$(pyenv root)/shims:\$PATH" >> ~/.zshrc

# Install rustup
brew install rustup
rustup-init -y

# Install unar
brew install unar

# Install mc
brew install mc

# Install nmap
brew install nmap

# Install jq
brew install jq

# Install xh
brew install xh

# Install pgcli
brew install pgcli

# install exa
brew install exa
echo "alias ls=exa" >> ~/.zshrc
echo "alias ll=\"exa -alh\"" >> ~/.zshrc
echo "alias tree=\"exa --tree\"" >> ~/.zshrc

# Install bat
brew install bat
echo "alias cat=$(brew --prefix)/bin/bat" >> ~/.zshrc
echo "alias ccat=/bin/cat" >> ~/.zshrc

# Install fd
brew install fd

# Install cheat
brew install cheat
git clone https://github.com/cheat/cheatsheets.git ~/.config/cheat/community

# Install duf
brew install duf

# Install dua
brew install dua-cli

# Install zoxide
brew install zoxide
echo "eval \"\$(zoxide init zsh)\"" >> ~/.zshrc
echo "alias cd=z" >> ~/.zshrc
echo "alias zz=\"z -\"" >> ~/.zshrc

# Install entr
brew install entr

# Install fzf
brew install fzf

# Install telnet
brew install telnet

# Install scc
brew install scc

# Install gnu-sed
brew install gnu-sed
echo "PATH=\"\$(brew --prefix)/opt/gnu-sed/libexec/gnubin:\$PATH\"" >> ~/.zshrc
