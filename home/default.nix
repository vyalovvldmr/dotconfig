{ username, ... }:

{
  # import sub modules
  imports = [
    ./git.nix
    ./shell.nix
    ./alacritty.nix
    ./oh-my-posh.nix
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}