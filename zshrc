# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# zsh-nvm flags
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true

# Set name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-nvm git colored-man-pages tmux nvm kubectl)

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# for p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# config PATH
# homebrew apps should take precedence
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/bin/python:$PATH"
# for yarn config
export PATH="$HOME/.yarn/bin:$PATH"
# for rust config
export PATH="$HOME/.cargo/bin:$PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

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

# source fzf for shell integration
if [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source homebrew config
if [ -f ~/.zprofile ]; then
  . ~/.zprofile
fi

# source lua-language-server
if [ -d ~/.lua-language-server ]; then
  export PATH="$HOME/.lua-language-server/bin:$PATH"
fi

# z
if [ -f /opt/homebrew/etc/profile.d/z.sh ]; then
    . /opt/homebrew/etc/profile.d/z.sh
fi

# point neorg to a newer compiler
export CC=gcc-12

# work config (any work related config should go here and will not be checked in)
if [ -f ~/.workconfig.sh ]; then
  . ~/.workconfig.sh
fi
