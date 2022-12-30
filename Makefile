install:
	brew tap homebrew/cask-fonts
	brew install --cask font-jetbrains-mono
	brew install --cask alacritty
	brew install zellij

init:
	@cp git/.gitconfig ~/.gitconfig
	@echo "Type username for git: "; \
	read USERNAME; \
	git config --global user.name "$$USERNAME" 
	@echo "Type email for git: "; \
	read EMAIL; \
	git config --global user.email "$$EMAIL" 
