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

  # Install pre-reqs
  print_status "Installing pre-reqs such as cURL and wget. Requires password."
  sudo apt install \
    curl \
    wget \

  # Install rustup
  if ! which rustc &> /dev/null; then
    print_status "Installing rustc toolchain. Requires input."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  fi

  # Install Rust specific tools
  print_status "Installing Rust specific tools."
  cargo install \
      zellij \
      eza \
      zoxide \
      git-delta \
      yazi-fm \
      yazi-cli \
  
  # Install packages
  print_status "Installing packages with apt."
  # Add fish ppa
  sudo apt-add-repository -y ppa:fish-shell/release-3
  # Add wezterm repo
	curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
  echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
  # add gh cli repo
	sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  # add helix ppa
  sudo add-apt-repository -y ppa:maveonair/helix-editor

  sudo apt update
  sudo apt install \
      ripgrep \
      fzf \
      bat \
      fish \
      fd-find \
      wezterm \
      gh \
      helix \

	# Install starship
	if [ ! -f /snap/bin/starship ]; then
	  print_status "Installing Starship."
	  curl -sS https://starship.rs/install.sh | sh
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
  symlink "${dotfiles}/yazi-picker.sh" ~/.config/helix/yazi-picker.sh
}

init() {
  install_prereqs
  link_files
}

init
