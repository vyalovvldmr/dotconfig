{ username, ... }:

{
  # import sub modules
  imports = [
    ./oh_my_posh.nix
    ./shell.nix
    ./git.nix
    
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}