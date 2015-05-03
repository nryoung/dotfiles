# Enable the ls aliases I use the most
alias ll='ls -l'
alias la='ls -la'

# Enable 256 color in tmux + vim
alias tmux='tmux -2'

# Source the virtulenvwrapper file
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    . /usr/local/bin/virtualenvwrapper.sh
fi

# Enable bash_completion on mac
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
