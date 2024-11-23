{
  programs.zsh = {
    initExtra = ''
      if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
        eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/unicorn.omp.json)"
      fi
    '';
  };
}