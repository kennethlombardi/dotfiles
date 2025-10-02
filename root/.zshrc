#defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
#defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
#export sublimetext.3 ApplePressAndHoldEnabled -bool false

export ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git nvm docker docker-compose fzf)

source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' file-list all

alias be="bundle exec"
alias vim="stty stop '' -ixoff; vim"
alias dcu="echo -e '\U0001f987'; docker-compose up"

#GO
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='find .'
export FZF_BASE=/opt/homebrew/bin/fzf

# NPM (N)
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Python
export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"

# Rust
# export PATH="$HOME/.cargo/bin:$PATH"
source "$HOME/.cargo/env"

# lvim, getnf, etc
export PATH=~/.local/bin:$PATH

