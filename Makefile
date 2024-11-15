tweaks:
	@./scripts/tweak_macos.sh

install:
	@./scripts/install_homebrew.sh
	@./scripts/install_cli_apps.sh
	@./scripts/install_cask_apps.sh

init:
	@./scripts/init_git.sh

rebuild:
	@darwin-rebuild switch --flake .