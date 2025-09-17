if status is-interactive
    # Enable vi key bindings
    fish_vi_key_bindings

    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source
    devbox completion fish | source
    direnv hook fish | source
    atuin init fish | source

    # config PATH
    # homebrew apps should take precedence
    export PATH="/opt/homebrew/bin:$PATH"
    # for yarn config
    export PATH="$HOME/.yarn/bin:$PATH"
    # for rust config
    export PATH="$HOME/.cargo/bin:$PATH"

    # set alias for reloading this config
    alias rlf='source ~/.config/fish/config.fish'

    # set Helix as default editor along with aliases
    export EDITOR="hx"
    export VISUAL="hx"
    alias vim="hx"
    alias nvim="hx"
    alias vvim="vim"
    alias nnvim="nvim"

    # set ls aliases
    alias ll='eza -al --group-directories-first --icons=always --color=always'
    alias la='eza -al --group-directories-first --icons=always --color=always'
    alias lf='eza -fla --icons=always --color=always'
    alias ld='eza -Dla --icons=always --color=always'
    alias lh='eza -dl .* --group-directories-first --icons=always --color=always'
    alias ls='eza -fla --icons=always --color=always --sort=size'
    alias lt='eza -la --tree --git-ignore --icons=always --color=always'
    alias lls='ls'

    # set fd aliases
    alias find='fd'
    alias ffind='find'

    # set bat aliases
    alias cat='bat'
    alias ccat='cat'

    # set rg aliases
    alias grep='rg'
    alias ggrep='grep'

    # set lazygit aliases
    alias lg='lazygit'

    # set newsboat alias
    if test (uname) = Linux
        alias nb='newsboat --url-file=/notes/urls.newsboat'
    else
        alias nb='newsboat --url-file=/Volumes/config/app_configs/urls.newsboat'
    end

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

    # Fisher installation and plugin setup
    if not test -f ~/.config/fish/functions/fisher.fish
        echo "Installing Fisher..."
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    end

    # Only install fzf.fish if it hasn't been installed already
    if not fisher list | rg -q patrickf1/fzf.fish
        echo "Installing fzf.fish plugin..."
        fisher install PatrickF1/fzf.fish
    end

    # ASDF configuration code
    if test -z $ASDF_DATA_DIR
        set _asdf_shims "$HOME/.asdf/shims"
    else
        set _asdf_shims "$ASDF_DATA_DIR/shims"
    end

    # Do not use fish_add_path (added in Fish 3.2) because it
    # potentially changes the order of items in PATH
    if not contains $_asdf_shims $PATH
        set -gx --prepend PATH $_asdf_shims
    end
    set --erase _asdf_shims
end
