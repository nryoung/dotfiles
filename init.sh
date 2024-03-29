#!/usr/bin/env bash

symlink() {
    # A symlink function that makes sure the target symlink's parent path
    # exists.

    # Expand ~ to $HOME if present
    local source="${1/#\~/$HOME}"
    local target="${2/#\~/$HOME}"

    [[ -e ${target} ]] && echo "'${target}' exists, skipping" && return

    mkdir -p "$(dirname ${target})"
    ln -s "${source}" "${target}"
}

install_prereqs() {
  # check to see if brew is installed. Install it if it isn't already
  if ! which brew &> /dev/null; then
    echo 'Installing `brew` package manager: https://brew.sh/'
    echo 'Requires user password'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Install packages
  echo "Installing packages with brew"
  brew install \
      neovim \
      tmux \
      fzf \
      ripgrep \
      ranger \
      cmake \
      gcc \
      gh \
      exa \
      bat \
      zoxide \
      fish \
      starship \
      fd \
      bat \
      git-delta \
      shortcat

  brew tap wez/wezterm
  brew install --cask wez/wezterm/wezterm

  # Install hammerspoon and ControlEscape spoon
  mkdir -p ~/.hammerspoon/Spoons
  git clone https://github.com/jasonrudolph/ControlEscape.spoon.git ~/.hammerspoon/Spoons/ControlEscape.spoon
  cd ~/.hammerspoon/Spoons/ControlEscape.spoon
  script/setup
}

link_files() {
    local readonly dotfiles="${HOME}/dotfiles"

    # sync all the things
    symlink "${dotfiles}/bash_aliases" ~/.bash_aliases
    symlink "${dotfiles}/bash_profile" ~/.bash_profile
    symlink "${dotfiles}/tmux.conf" ~/.tmux.conf
    symlink "${dotfiles}/nvim" ~/.config/nvim
    symlink "${dotfiles}/gitconfig" ~/.gitconfig
    symlink "${dotfiles}/wezterm" ~/.config/wezterm
    symlink "${dotfiles}/config.fish" ~/.config/fish/config.fish
    symlink "${dotfiles}/fish_plugins" ~/.config/fish/fish_plugins
}

init() {
  install_prereqs
  link_files
}

init
