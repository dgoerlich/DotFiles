# Prompt Setup
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

YELLOW='\[\033[1;33m\]'
BLUE='\[\033[1;34m\]'
GREEN='\[\033[1;32m\]'
RED='\[\033[0;31m\]'
NORMAL='\[\033[00m\]'

function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}

git_prompt() {
  # The __git_ps1 function inserts the current git branch where %s is
  local GIT_BRANCH=`__git_ps1 "%s"`

  local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`

  if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
    local COLOR=${RED}
  elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
    local COLOR=${YELLOW}
  else
    local COLOR=${GREEN}
  fi

  PS1="[\W] ${GIT_BRANCH} ${COLOR}${MINUTES_SINCE_LAST_COMMIT}m${NORMAL} $ "
}

set_prompt() {
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
      git_prompt
    else
      PS1="[\W] $ "
    fi
}

. /etc/profile.d/vte.sh

NEW_PROMPT=set_prompt

PROMPT_COMMAND="${NEW_PROMPT};__vte_prompt_command"

