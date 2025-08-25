{ inputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    ../../modules/fish
    ../../modules/git.nix
    ../../modules/helix
    ../../modules/wezterm
    ../../modules/zsh.nix
    ../../modules/zellij
  ];

  home = {
    username = "nyoung";
    homeDirectory = "/Users/nyoung";
  };

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    zsh
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
    just
    jujutsu
    lazygit
    pkgs.clang
    pkgs.docker
    pkgs.glow
    pkgs.nil
    pkgs.podman
    pkgs.rustup
    pkgs.zola
    nil
    ripgrep
    starship
    wezterm
    yazi
    zellij
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

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
