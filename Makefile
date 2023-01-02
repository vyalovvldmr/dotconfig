install:
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
	brew tap homebrew/cask-fonts
	brew install --cask font-jetbrains-mono
	brew install --cask alacritty
	brew install zellij
	brew install starship
	echo "eval \"$$(starship init zsh)\"" >> ~/.zshrc

init:
	@cp git/.gitconfig ~/.gitconfig
	@echo "Type username for git: "; \
	read USERNAME; \
	git config --global user.name "$$USERNAME" 
	@echo "Type email for git: "; \
	read EMAIL; \
	git config --global user.email "$$EMAIL" 
