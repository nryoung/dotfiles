{ config, lib, pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellInitLast = builtins.readFile ./config.fish;
  };
}
