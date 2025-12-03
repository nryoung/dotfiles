{ inputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    ../../modules/bash.nix
    ../../modules/fish
    ../../modules/git.nix
    ../../modules/helix
  ];

  home = {
    username = "nic";
    homeDirectory = "/home/nic";
  };

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    bash
    bat
    delta
    eza
    fd
    fira-code
    fish
    fzf
    gh
    git
    jq
    lazygit
    pkgs.atuin
    pkgs.bottom
    pkgs.calibre
    ripgrep
    starship
    yazi
    zoxide
  ];

  # Enable programs that don't require extra config here
  programs.bat.enable = true;
  programs.eza.enable = true;
  programs.fd.enable = true;
  programs.fzf.enable = true;
  programs.gh.enable = true;
  programs.jq.enable = true;
  programs.lazygit.enable = true;
  programs.ripgrep.enable = true;
  programs.starship.enable = true;
  programs.yazi.enable = true;
  programs.zoxide.enable = true;

  # Enable font configuration
  fonts.fontconfig.enable = true;

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
