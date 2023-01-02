install:
	# Install Sublime Text
	brew install --cask sublime-text
	# Install zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
	# Install JetBrains fonts
	brew tap homebrew/cask-fonts
	brew install --cask font-jetbrains-mono
	# Install Alacritty Terminal
	brew install --cask alacritty
	# Install Zellij
	brew install zellij
	# Install Starship
	brew install starship
	echo "eval \"$$(starship init zsh)\"" >> ~/.zshrc
	# Install Docker
	brew install --cask docker
	open /Applications/Docker.app
	# Install Firefox Developer edition
	brew tap homebrew/cask-versions
	brew install --cask firefox-developer-edition
	# Install KeePassXC
	brew install --cask keepassxc

init:
	# Init Git config
	@cp git/.gitconfig ~/.gitconfig
	@echo "Type username for git: "; \
	read USERNAME; \
	git config --global user.name "$$USERNAME" 
	@echo "Type email for git: "; \
	read EMAIL; \
	git config --global user.email "$$EMAIL" 
