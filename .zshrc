if [ "$TMUX" = "" ]; then tmux; fi

export PATH=$PATH:/home/ralex/.local/bin

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="lambda-vim"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

HIST_STAMPS="yyyy-mm-dd"

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt APPEND_HISTORY
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS

export FZF_DEFAULT_COMMAND='ag --hidden -g ""'

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git fzf zsh-autosuggestions zsh-syntax-highlighting zsh-vim-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='nvim'

bindkey "^r" fzf-history-widget
bindkey "^e" history-incremental-search-backward
