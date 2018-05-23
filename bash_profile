# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
