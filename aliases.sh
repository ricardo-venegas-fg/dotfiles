#!/usr/bin/env bash

# A base set of aliases, delete or modify as you wish.
alias mono="cd sharex/monolith"
alias rserv="bundle exec rails server"
alias rjob="bundle exec rake jobs:work"
alias yst="yarn start"
alias used_prebuild="cat /workspaces/.codespaces/shared/environment-variables.json | jq '.ACTION_NAME'"
alias be="bundle exec"
alias ss="bundle exec spring stop"
# Add other aliases if needed.

# Codespaces zsh prompt theme
__zsh_prompt() {
  local prompt_username
  if [ ! -z "${GITHUB_USER}" ]; then
    prompt_username="@${GITHUB_USER}"
  else
    prompt_username="%n"
  fi
  PROMPT="%{$fg[green]%}${prompt_username} %(?:%{$reset_color%}➜ :%{$fg_bold[red]%}➜ )"                   # User/exit code arrow
  PROMPT+='%{$fg_bold[blue]%}%(5~|%-1~/…/%3~|%4~)%{$reset_color%} '                                       # cwd
  PROMPT+='$([ "$(git config --get codespaces-theme.hide-status 2>/dev/null)" != 1 ] && git_prompt_info)' # Git status
  PROMPT+=$'\n'
  PROMPT+='%{$fg[white]%}zsh> %{$reset_color%}'
  unset -f __zsh_prompt
}
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}(%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}✗%{$fg_bold[cyan]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[cyan]%})"
__zsh_prompt