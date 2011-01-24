# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source ~/.dotfiles/.gittabcomplete

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
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
        local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
        if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
            local COLOR=${RED}
        elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
            local COLOR=${YELLOW}
        else
            local COLOR=${GREEN}
        fi

        # The __git_ps1 function inserts the current git branch where %s is
        local GIT_BRANCH=`__git_ps1 "%s"`
        PS1="[\W] ${GIT_BRANCH} ${COLOR}$(minutes_since_last_commit)m${NORMAL} $ "
    fi
}

set_prompt() {
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
      git_prompt
    else
      PS1="[\W] $ "
    fi
}

PROMPT_COMMAND=set_prompt

# User specific aliases and functions
alias v='gvim '

alias gs='git status'
alias ga='git add -A'
alias gc='git commit -m '
alias gb='git branch -a'
alias push='git push'
alias ptags='git push --tags'
alias pull='git pull --rebase'
alias branch='git checkout -b '
alias checkout='git checkout '
alias rebase='git rebase master'


alias sandstone='cd /source/sandstone'
alias vsand4='~/tools/sandstone4'
alias vsand45='~/tools/sandstone45'
alias vsand5='~/tools/sandstone5'

alias phpdoc='cd /source/phpdocumentor'
alias vphp='~/tools/phpdocumentor'

alias arg='cd /source/applications/arg'

alias univ='cd /source/applications/university'
alias univt='cd /source/applications/universitytemplates'

alias univr='cd /source/ruby/prfessoronrails/'

alias s5='cd /source/applications/simpli5'

alias writer='cd /source/applications/writer'

alias bt='cd /source/applications/badgetracker'

alias sql='mysql '
alias vsql='~/tools/sql/editsql'
alias database='cd ~/Database'

alias runsql='~/tools/sql/runsql'
alias devsql='~/tools/sql/devsql'
alias prodsql='~/tools/sql/prodsql'
alias prod2sql='~/tools/sql/prod2sql'

alias sshprod1='ssh dgoerlic@server001.designinginteractive.com'
alias sshprod2='ssh dgoerlic@server002.designinginteractive.com'
alias sshprod3='ssh dgoerlich@server003.designinginteractive.com'

alias ssand5='~/tools/spec/ssand5'

export JAVA_HOME=/usr/lib/jvm/jre
export EC2_HOME=/home/dgoerlich/EC2
export PATH=$PATH:$EC2_HOME/bin:/home/dgoerlich/android-sdk/tools
export EC2_PRIVATE_KEY=~/keys/pk-GDNQBRAFRQPWESRLVN6M665PCXHU2QMF.pem 
export EC2_CERT=~/keys/cert-GDNQBRAFRQPWESRLVN6M665PCXHU2QMF.pem  

alias memstart='memcached -d -m 5 -l 127.0.0.1 -p 11211';
alias memstop='killall memcached';
alias memreset='memstop; memstart';

source $HOME/.rvm/scripts/rvm

alias cwip='cucumber -p wip'
alias cuke='cucumber --tags ~@backlog'
alias ci='cuke; cwip'
