{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
        eval "$(/opt/homebrew/bin/brew shellenv)"

        if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
            eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/unicorn.omp.json)"
        fi
    '';
  };

  home.shellAliases = {
    k = "kubectl";
  };
}