# lambda-vim theme

PROMPT='%{$fg[green]%}╭─$(_user_host)%{$reset_color%}$(virtualenv_prompt_info) in $(_current_dir) $(_git_prompt_info)
%{$fg[green]%}╰─%{$resetcolor%}%{${fg[$CARETCOLOR]}%}λ%{$resetcolor%} '

PROMPT2='%{${fg[$CARETCOLOR]}%}λ%{$resetcolor%} '

RPROMPT='${vcs_info_msg_0_} $(_return_status) %{${fg[blue]}%}(${__cmdtime})%{$reset_color%} < %{$FG[008]%}%*%{$reset_color%} ${MODE_INDICATOR_PROMPT}'

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

ZSH_THEME_VIRTUALENV_PREFIX=%{${fg[yellow]}%}[
ZSH_THEME_VIRTUALENV_SUFFIX=]%{$reset_color%}

# cmdtime - https://github.com/tom-auger/cmdtime - Copyright (c) 2021 Tom Auger

zmodload zsh/datetime

local __cmdtime=$(printf '%.3fs' 0)

__cmdtime_current_time() {
  echo $EPOCHREALTIME
}

__cmdtime_format_duration() {
  local hours=$(printf '%u' $(($1 / 3600)))
  local mins=$(printf '%u' $((($1 - hours * 3600) / 60)))
  local secs=$(printf "%.3f" $(($1 - 60 * mins - 3600 * hours)))
  if [[ ! "${mins}" == "0" ]] || [[ ! "${hours}" == "0" ]]; then
      # If there are a non zero number of minutes or hours
      # then display integer number of seconds
      secs=${secs%\.*}
  elif [[ "${secs}" =~ "^0\..*" ]]; then
      # If secs starts with 0. i.e. is less than 1 then display
      # the number of milliseconds instead. Strip off the leading
      # zeros and append an 'm'.
      secs="${${${secs#0.}#0}#0}m"
  fi
  local duration_str=$(echo "${hours}h:${mins}m:${secs}s")
  local format="${TIMER_FORMAT:-%d}"
  echo "${format//\%d/${${duration_str#0h:}#0m:}}"
}

__cmdtime_save_time_preexec() {
  __cmdtime_cmd_start_time=$(__cmdtime_current_time)
}

__cmdtime_display_cmdtime_precmd() {
  if [ -n "${__cmdtime_cmd_start_time}" ]; then
    local cmd_end_time=$(__cmdtime_current_time)
    local tdiff=$((cmd_end_time - __cmdtime_cmd_start_time))
    unset __cmdtime_cmd_start_time
    if [[ -z "${TIMER_THRESHOLD}" || ${tdiff} -ge "${TIMER_THRESHOLD}" ]]; then
        __cmdtime=$(__cmdtime_format_duration ${tdiff})
    fi
  fi
}

autoload -U add-zsh-hook
add-zsh-hook preexec __cmdtime_save_time_preexec
add-zsh-hook precmd __cmdtime_display_cmdtime_precmd
