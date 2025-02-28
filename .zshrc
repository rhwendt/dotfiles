# p10k - must go at the top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Autoload zsh shell functions defined in the function path 
fpath+=( ~/.zsh_autoload_functions "${fpath[@]}" )
autoload -Uz load_github

# need to source this first
source ~/.antigen.zsh

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

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# vivid
export LS_COLORS="$(vivid generate tokyonight-storm)"

# k8s
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# exports
export EDITOR='nvim'
export GOPATH=$(go env GOPATH)
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$PATH:/opt/nvim/"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=72'

# aliases
alias vi='nvim'
alias ll='ls -al'
alias ys='yadm status'
alias ya='yadm_add' 
alias yc='yadm commit -am'
alias yp='yadm push'

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
