if [ "$TMUX" = "" ]; then tmux; fi

export PATH=$PATH:/home/ralex/.local/bin

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="lambda-vim"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-vim-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='nvim'

