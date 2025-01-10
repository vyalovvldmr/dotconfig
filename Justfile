install:
	@/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
	@source ~/.zshrc
	@curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
	@. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
	@nix run nix-darwin -- switch --flake .

rebuild:
	@darwin-rebuild switch --flake .
