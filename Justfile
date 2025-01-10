install:
	@curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
	@/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
	@source ~/.zshrc
	@nix run nix-darwin -- switch --flake .

rebuild:
	@darwin-rebuild switch --flake .
