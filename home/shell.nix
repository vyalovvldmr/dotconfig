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
        export HISTSIZE=100000
        export SAVEHIST=$HISTSIZE
        export HISTFILE=~/.zsh_history
        setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
        setopt SHARE_HISTORY             # Share history between all sessions.
        setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
        setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
        setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
        setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

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
        alias x="cargo xtask"
        alias k=kubectl
    '';
  };

  home.shellAliases = {
    k = "kubectl";
  };
}