source $HOME/.local/antigen.zsh
source $HOME/.profile

[[ -z "$TMUX" && -n "$USE_TMUX" ]] && {
    [[ -n "$ATTACH_ONLY" ]] && {
        tmux a 2>/dev/null || {
            cd && exec tmux
        }
        exit
    }

    tmux new-window -c "$PWD" 2>/dev/null && exec tmux a
    exec tmux
}


# WSL workaround
unsetopt BG_NICE

# Load oh-my-zsh
antigen use oh-my-zsh

# Bundles from oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle command-not-found

# Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# Load theme
antigen theme fox 

# Apply configuration
antigen apply
