# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

source ~/.dotfiles/gittabcomplete.bashrc
source ~/.dotfiles/prompt.bashrc
source ~/.dotfiles/ec2.bashrc
source ~/.dotfiles/rbenv.bashrc

# User specific aliases and functions
source ~/.dotfiles/git.alias
source ~/.dotfiles/vim.alias
source ~/.dotfiles/quickjump.alias
source ~/.dotfiles/sandstone.alias
source ~/.dotfiles/sql.alias
source ~/.dotfiles/ssh.alias
source ~/.dotfiles/memcahce.alias
source ~/.dotfiles/cucumber.alias

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
