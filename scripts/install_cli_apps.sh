#!/bin/bash

set -Eeu pipefail

eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing cli apps..."

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

# Install Zellij
brew install zellij

# Install Starship
brew install starship
echo "eval \"$(starship init zsh)\"" >> ~/.zshrc

# Install neovim
brew install neovim
echo "alias vi=/opt/homebrew/bin/nvim" >> ~/.zshrc

# Install htop
brew install htop

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
