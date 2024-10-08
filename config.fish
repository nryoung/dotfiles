if status is-interactive
    # Enable vi key bindings
    fish_vi_key_bindings

    # Commands to run in interactive sessions can go here
    /snap/bin/starship init fish | source
    /usr/bin/zoxide init fish | source

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

    # Zellij alias
    function zr
        command zellij run --name "$argv" -- fish -c "$argv"
    end
    function zrf
        command zellij run --name "$argv" --floating -- fish -c "$argv"
    end
    function zri
        command zellij run --name "$argv" --in-place -- fish -c "$argv"
    end
    function ze
        command zellij edit $argv
    end
    function zef
        command zellij edit --floating $argv
    end
    function zei
        command zellij edit --in-place $argv
    end

    # the zpipe alias and its completions
    function __fish_complete_aliases
        zellij list-aliases 2>/dev/null
    end
    function zpipe
        if count $argv >/dev/null
            command zellij pipe -p $argv
        else
            command zellij pipe
        end
    end

    # work config (any work related config should go here and will not be checked in)
    if test -f ~/.workconfig.sh
      . ~/.workconfig.sh
    end
end

source ~/.asdf/asdf.fish
