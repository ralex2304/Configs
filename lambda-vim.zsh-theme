# lambda-vim theme

PROMPT='%{$fg[green]%}╭─$(_user_host)%{$reset_color%} in $(_current_dir) $(_git_prompt_info)
%{$fg[green]%}╰─%{$resetcolor%}%{${fg[$CARETCOLOR]}%}λ%{$resetcolor%} '

PROMPT2='%{${fg[$CARETCOLOR]}%}λ%{$resetcolor%} '

RPROMPT='${vcs_info_msg_0_} $(_return_status) %{${fg[blue]}%}(${elapsed})%{$reset_color%} < %{$FG[008]%}%*%{$reset_color%} ${MODE_INDICATOR_PROMPT}'

function _return_status() {
  echo -e "%(?.%{$fg[green]%}%?%{$reset_color%}.%{$fg[red]%}%?%{$reset_color%})"
}

function _git_prompt_info() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo "($(_omz_git_prompt_info))"
    fi
}

function _current_dir() {
    echo "%{$fg_bold[blue]%}%~%{$reset_color%}"
}

function _user_host() {
    if [[ -n $SSH_CONNECTION ]]; then
        me="%n@%m"
    else
        me="%n"
    fi

    if [[ -n $me ]]; then
        echo "$me%{$reset_color%}"
    fi
}

if [[ $USER == "root" ]]; then
    CARETCOLOR="red"
else
    CARETCOLOR="white"
fi

setopt PROMPT_SUBST

MODE_INDICATOR_VIINS="%{$BG[010]%}%{$FG[000]%} i %{$reset_color%}"
MODE_INDICATOR_VICMD="%{$BG[153]%}%{$FG[000]%} n %{$reset_color%}"
MODE_INDICATOR_REPLACE="%{$BG[204]%}%{$FG[000]%} r %{$reset_color%}"
MODE_INDICATOR_SEARCH="%{$BG[223]%}%{$FG[000]%} c %{$reset_color%}"
MODE_INDICATOR_VISUAL="%{$BG[177]%}%{$FG[000]%} v %{$reset_color%}"
MODE_INDICATOR_VLINE="%{$BG[177]%}%{$FG[000]%} v %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%}◒ "

