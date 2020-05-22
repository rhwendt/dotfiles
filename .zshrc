# p10k - must go at the top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
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
export PATH=$PATH:/home/rwendt/.local/bin
export NVM_DIR="$HOME/.nvm"
export RENDER_OUTPUT_LOCATION=~/config-renders

# aliases
alias vim=nvim
alias vi=nvim
alias sspass='f(){ echo -ne "\033]0;$@\007" ; sshpass -f <(pass idm/rwendt) ssh "$@"; unset -f f; }; f'
alias scpass='f(){ echo -ne "\033]0;$@\007" ; sshpass -f <(pass idm/rwendt) scp "$@"; unset -f f; }; f'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# virtual envs
source /usr/bin/virtualenvwrapper.sh

# node version manager
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# private stuff
for file in ~/.private/*; do
    source "$file"
done

# p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

