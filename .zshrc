# p10k - must go at the top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

# need to source this first
source ~/git/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle vi-mode
antigen bundle command-not-found
antigen bundle tmuxinator/tmuxinator

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

# hotkey for autosuggestions
bindkey '^ ' autosuggest-accept

# exports
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=72'
export EDITOR='nvim'
export NVM_DIR="$HOME/.nvm"
export RENDER_OUTPUT_LOCATION=~/config-renders
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass
# export GPG_TTY=$(tty)

# aliases
alias vim=nvim
alias vi=nvim
alias sspass='f(){ echo -ne "\033]0;$@\007" ; sshpass -f <(pass idm/rwendt) ssh "$@"; unset -f f; }; f'
alias scpass='f(){ echo -ne "\033]0;$@\007" ; sshpass -f <(pass idm/rwendt) scp "$@"; unset -f f; }; f'
alias ll='ls -al'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rwendt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rwendt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rwendt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rwendt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# node version manager
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
