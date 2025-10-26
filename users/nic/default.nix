{ inputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    ../../modules/bash.nix
    ../../modules/firefox.nix
    ../../modules/fish
    ../../modules/git.nix
    ../../modules/helix
    ../../modules/newsboat.nix
    ../../modules/wezterm
    ../../modules/zellij
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
    firefox
    fish
    fzf
    gh
    git
    jq
    lazygit
    pkgs._1password-cli
    pkgs._1password-gui
    pkgs.atuin
    pkgs.calibre
    pkgs.clang
    pkgs.cryptomator
    pkgs.direnv
    pkgs.exiftool
    pkgs.glow
    pkgs.localsend
    pkgs.mediainfo
    pkgs.nicotine-plus
    pkgs.nil
    pkgs.papers
    # pkgs.openmw
    pkgs.protonvpn-gui
    pkgs.qbittorrent
    pkgs.rustup
    pkgs.signal-desktop
    pkgs.vlc
    pkgs.zola
    ripgrep
    starship
    wezterm
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
