{ username, ... }:

{
  # import sub modules
  imports = [
    ./shell.nix
    ./git.nix
    ./oh_my_posh.nix
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}