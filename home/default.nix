{ username, ... }:

{
  # import sub modules
  imports = [
    ./git.nix
    ./shell.nix
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "24.11";
  };

  home.file.".config/helix" = {
    source = ./helix;
    recursive = true;
  };

  home.file.".config/oh-my-posh" = {
    source = ./oh-my-posh;
    recursive = true;
  };

  home.file.".config/alacritty" = {
    source = ./alacritty;
    recursive = true;
  };
  home.file."Library/KeyBindings" = {
    source = ./key_bindings;
    recursive = true;
  };
  programs.home-manager.enable = true;
}
