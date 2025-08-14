{ config, lib, pkgs, ... }: {
  programs.zellij = {
    enable = true;
     
  };
  xdg.configFile."zellij".source = ./config;
}
