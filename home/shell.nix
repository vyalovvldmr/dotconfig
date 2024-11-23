{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
  };

  home.shellAliases = {
    k = "kubectl";
  };
}