export GPG_TTY=$(tty)
# p10k - must go at the top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Autoload zsh shell functions defined in the function path 
fpath+=( ~/.zsh_autoload_functions "${fpath[@]}" )
autoload -Uz load_github

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
export NVM_DIR="$HOME/.config/nvm"
export RENDER_OUTPUT_LOCATION=~/config-renders
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass.txt

function yadm_changed() { yadm status --porcelain=v2 | awk '{printf "%s ",$9}';}
function yadm_add() {yadm add `yadm_changed`;}

# aliases
alias vim=nvim
alias vi=nvim
alias sspass='f(){ echo -ne "\033]0;$@\007" ; sshpass -f <(pass idm/rwendt) ssh "$@"; unset -f f; }; f'
alias ncpass='f(){ echo -ne "\033]0;$@\007" ; sshpass -f <(pass idm/rwendt) ssh "$@" -p 830 -s netconf; unset -f f; }; f'
alias scpass='f(){ echo -ne "\033]0;$@\007" ; sshpass -f <(pass idm/rwendt) scp "$@"; unset -f f; }; f'
alias bwlogin='bw login rhwendt@gmail.com $(pass home/bitwarden)'
alias ll='ls -al'
alias ys='yadm status'
alias ya='yadm_add' 
alias yc='yadm commit -am'
alias yp='yadm push'


# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# node version manager
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

eval "`dircolors ~/.dir_colors/dircolors`"

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/home/rwendt/.local/bin:$PATH"
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
export GOPATH=$(go env GOPATH)
export PATH="$GOPATH/bin:$PATH"
export DENO_INSTALL="/home/rwendt/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
