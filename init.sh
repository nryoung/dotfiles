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

print_status() {
  # A function to display what step the script is on
  echo "###############################################################################"
  echo "$1"
  echo "###############################################################################"
}

install_prereqs() {

  # Install brew
  if ! which brew &> /dev/null; then
    print_status "Installing brew."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Install pre-reqs
  print_status "Installing pre-reqs such as cURL, wget, coreutils and git."
  brew install \
    curl \
    wget \
    coreutils \
    git \

  # Install rustup
  if ! which rustc &> /dev/null; then
    print_status "Installing rustc toolchain. Requires input."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  fi

  # Install packages
  print_status "Installing packages with brew."
  brew install \
      zellij \
      eza \
      zoxide \
      git-delta \
      yazi \
      ffmpegthumbnailer \
      sevenzip \
      jq \
      poppler \
      fd \
      ripgrep \
      fzf \
      imagemagick \
      font-symbols-only-nerd-font \
      bat \
      fish \
      gh \
      starship \
      jesseduffield/lazygit/lazygit \
      lazygit \
      helix \

  brew install --cask wezterm

  # Install Hammerspoon and ControlEscape spoon
  if [ ! -d "${HOME}/.hammerspoon/Spoons" ]; then
    print_status "Installing Hammerspoon and ControlEscape spoon."
    mkdir -p ~/.hammerspoon/Spoons
    git clone https://github.com/jasonrudolph/ControlEscape.spoon.git ~/.hammerspoon/Spoons/ControlEscape.spoon
    cd ~/.hammerspoon/Spoons/ControlEscape.spoon
    script/setup
  fi

  # Install asdf
  if [ ! -d "${HOME}/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
    mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
  fi
}

link_files() {
  print_status "Symlinking config files if needed."

  local readonly dotfiles="${HOME}/dotfiles"

  # sync all the things
  symlink "${dotfiles}/gitconfig" ~/.gitconfig
  symlink "${dotfiles}/wezterm" ~/.config/wezterm
  symlink "${dotfiles}/fish/config.fish" ~/.config/fish/config.fish
  symlink "${dotfiles}/fish/fish_plugins" ~/.config/fish/fish_plugins
  symlink "${dotfiles}/helix/config.toml" ~/.config/helix/config.toml
  symlink "${dotfiles}/helix/languages.toml" ~/.config/helix/languages.toml
  symlink "${dotfiles}/helix/yazi-picker.sh" ~/.config/helix/yazi-picker.sh
}

init() {
  install_prereqs
  link_files
}

init
