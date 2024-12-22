{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
        eval "$(/opt/homebrew/bin/brew shellenv)"

        if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
            eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/unicorn.omp.json)"
        fi

        source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        export LC_ALL=en_US.UTF-8
        export LANG=en_US.UTF-8

        source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
        bindkey '^[[A' history-substring-search-up
        bindkey '^[[B' history-substring-search-down

        bindkey '^[[H' beginning-of-line
        bindkey '^[[F' end-of-line
        bindkey '^[[3~' delete-char

        alias ls=eza
        alias ll="eza -alh"
        alias tree="exa --tree"
        alias cat=$(brew --prefix)/bin/bat
        alias ccat=/bin/cat
        eval "$(zoxide init zsh)"
        alias cd=z
        alias zz="z -"
    '';
  };

  home.shellAliases = {
    k = "kubectl";
  };
}