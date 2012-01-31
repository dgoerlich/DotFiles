# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
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
