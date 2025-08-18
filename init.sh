#!/usr/bin/env bash

  # Install Hammerspoon and ControlEscape spoon
  if [ ! -d "${HOME}/.hammerspoon/Spoons" ]; then
    print_status "Installing Hammerspoon and ControlEscape spoon."
    mkdir -p ~/.hammerspoon/Spoons
    git clone https://github.com/jasonrudolph/ControlEscape.spoon.git ~/.hammerspoon/Spoons/ControlEscape.spoon
    cd ~/.hammerspoon/Spoons/ControlEscape.spoon
    script/setup
  fi
