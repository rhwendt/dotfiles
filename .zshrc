# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/git/antigen/antigen.zsh
export EDITOR='nvim'

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
#antigen theme agnoster
antigen theme romkatv/powerlevel10k


# Tell Antigen that you're done.
antigen apply

# change the suggestion color
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=72'

alias vim=nvim
alias vi=nvim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '^ ' autosuggest-accept
source ~/.antigen/bundles/tmuxinator/tmuxinator/completion/tmuxinator.zsh
source /usr/bin/virtualenvwrapper.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# color settings
export TERM=xterm-256color
export PATH=$PATH:/home/rwendt/.local/bin

# private stuff
for file in ~/.private/*; do
    source "$file"
done
