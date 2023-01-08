tweaks:
	sh scripts/tweak_macos.sh

install:
	sh scripts/install_homebrew.sh
	sh scripts/install_cli_apps.sh
	sh scripts/install_cask_apps.sh

init:
	@sh scripts/init_git.sh
