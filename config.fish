if status is-interactive
    # Enable vi key bindings
    fish_vi_key_bindings

    # Commands to run in interactive sessions can go here
    /opt/homebrew/bin/starship init fish | source
    /opt/homebrew/bin/zoxide init fish | source

    # config PATH
    # homebrew apps should take precedence
    export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/bin/python:$PATH"
    # for yarn config
    export PATH="$HOME/.yarn/bin:$PATH"
    # for rust config
    export PATH="$HOME/.cargo/bin:$PATH"
    
    # Enable ls aliases
    alias ll='exa -l -g --icons'
    alias la='exa -la -g --icons'
    alias lt='exa -la -g --icons --tree --git-ignore'
    
    # Enable 256 color in tmux + vim
    alias tmux='tmux -2'
    
    # Use neovim instead
    alias vim='nvim'
    # use python3
    alias python='python3'
    
    # source lua-language-server
    if test -d ~/.lua-language-server
      export PATH="$HOME/.lua-language-server/bin:$PATH"
    end
    
    # point neorg to a newer compiler
    export CC=gcc-12
    
    # work config (any work related config should go here and will not be checked in)
    if test -f ~/.workconfig.sh
      . ~/.workconfig.sh
    end
end
