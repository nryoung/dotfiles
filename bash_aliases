# enable the ls aliases I use the most
alias ll='ls -l'
alias la='ls -la'

# enable 256 color in tmux + vim
alias tmux='tmux -2'

# source the virtulenvwrapper file
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    . /usr/bin/virtualenvwrapper.sh
fi
