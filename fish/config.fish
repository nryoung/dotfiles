if status is-interactive
    # Enable vi key bindings
    fish_vi_key_bindings

    # Commands to run in interactive sessions can go here
    /opt/homebrew/bin/starship init fish | source
    /opt/homebrew/bin/zoxide init fish | source

    # config PATH
    # homebrew apps should take precedence
    export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
    # for yarn config
    export PATH="$HOME/.yarn/bin:$PATH"
    # for rust config
    export PATH="$HOME/.cargo/bin:$PATH"

    # set alias for notes
    alias n="hx ~/Workspace/notes/notes.md"
    # set alias for reloading this config
    alias rlf="source ~/.config/fish/config.fish"

    # set Helix as default editor along with aliases
    export EDITOR="hx"
    export VISUAL="hx"
    alias vim="hx"
    alias nvim="hx"
    alias vvim="vim"
    alias nnvim="nvim"

    # set ls aliases
    alias ll="eza -al --group-directories-first --icons=always --color=always"
    alias la="eza -al --group-directories-first --icons=always --color=always"
    alias lf="eza -fla --icons=always --color=always"
    alias ld="eza -Dla --icons=always --color=always"
    alias lh="eza -dl .* --group-directories-first --icons=always --color=always"
    alias ls="eza -fla --icons=always --color=always --sort=size"
    alias lt="eza -la --tree --git-ignore --icons=always --color=always"
    alias lls="ls"

    # set fd aliases
    alias find="fd"
    alias ffind="find"

    # set bat aliases
    alias cat="bat"
    alias ccat="cat"

    # set rg aliases
    alias grep="rg"
    alias ggrep="grep"

    # set lazygit aliases
    alias lg="lazygit"

    # set yazi shell wrapper
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    # set zellij integration
    function zjr
        command zellij run --name "$argv" -- fish -c "$argv"
    end
    function zjrf
        command zellij run --name "$argv" --floating -- fish -c "$argv"
    end
    function zjri
        command zellij run --name "$argv" --in-place -- fish -c "$argv"
    end
    function zje
        command zellij edit $argv
    end
    function zjef
        command zellij edit --floating $argv
    end
    function zjei
        command zellij edit --in-place $argv
    end

    # the zpipe alias and its completions
    function __fish_complete_aliases
        zellij list-aliases 2>/dev/null
    end
    function zjpipe
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

# uv
fish_add_path "/Users/nyoung/.local/bin"

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
