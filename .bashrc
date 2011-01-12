# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "→ ${ref#refs/heads/}"
}

PS1="[\W \$(parse_git_branch)] $ "

# User specific aliases and functions
alias v='gvim '
alias pa='~/tools/pa'

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
alias varg='~/tools/arg'

alias univ='cd /source/applications/university'
alias univt='cd /source/applications/universitytemplates'
alias vuniv='~/tools/univ'
alias vunivt='~/tools/univ-t'

alias univr='cd /source/ruby/prfessoronrails/'

alias s5='cd /source/applications/simpli5'
alias vs5='~/tools/s5'

alias writer='cd /source/applications/writer'
alias vwriter='~/tools/writer'

alias bt='cd /source/applications/badgetracker'
alias vbt='~/tools/bt'

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
