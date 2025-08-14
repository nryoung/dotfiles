{ inputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    ../../modules/bash.nix
    ../../modules/fish
    ../../modules/firefox.nix
    ../../modules/git.nix
    ../../modules/helix
    ../../modules/wezterm
  ];

  home = {
    username = "nic";
    homeDirectory = "/home/nic";
  };

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    pkgs._1password-cli
    pkgs._1password-gui
    bash
    bat
    pkgs.clang
    pkgs.calibre
    pkgs.element-desktop
    eza
    fd
    fira-code
    firefox
    fish
    fzf
    git
    gh
    jq
    lazygit
    pkgs.protonvpn-gui
    pkgs.openmw
    pkgs.obsidian
    pkgs.qbittorrent
    ripgrep
    pkgs.rustup
    pkgs.nicotine-plus
    starship
    pkgs.signal-desktop
    pkgs.vlc
    wezterm
    yazi
    zellij
    pkgs.zola
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
  programs.zellij.enable = true;
  programs.zoxide.enable = true;

  # switch touchpad scrolling to reverse
  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" =
      {
        natural-scroll = false;
      };
  };


  # Enable font configuration
  fonts.fontconfig.enable = true;

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
