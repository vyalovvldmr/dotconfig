init:
	@cp git/.gitconfig ~/.gitconfig
	@echo "Type username for git: "; \
	read USERNAME; \
	git config --global user.name "$$USERNAME" 
	@echo "Type email for git: "; \
	read EMAIL; \
	git config --global user.email "$$EMAIL" 
