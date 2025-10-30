{ inputs
, lib
, config
, pkgs
, ...
}:
let
  profilesFilePath = "$HOME/Library/Application\\ Support/Firefox/profiles.ini";
in
{

  imports = [
    ../../modules/firefox.nix
    ../../modules/fish
    ../../modules/git.nix
    ../../modules/helix
    # ../../modules/newsboat.nix
    ../../modules/wezterm
    ../../modules/zsh.nix
    ../../modules/zellij
  ];

  home = {
    username = "NYG4";
    homeDirectory = "/Users/NYG4";
  };

  # Firefox from homebrew doesn't open with symlinks
  # https://www.reddit.com/r/NixOS/comments/1fiomft/comment/lnm20pk/
  home.activation.firefoxWriteBoundary =
    lib.hm.dag.entryAfter
      [
        "writeBoundary"
        "linkGeneration"
      ]
      ''
        run mv ${profilesFilePath} ${profilesFilePath}.hm
        run cp "`readlink ${profilesFilePath}.hm`" ${profilesFilePath}
        run rm -f ${profilesFilePath}.$HOME_MANAGER_BACKUP_EXT
        run chmod u+w ${profilesFilePath}
      '';

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    zsh
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
    just
    jujutsu
    lazygit
    pkgs.atuin
    pkgs.awscli2
    pkgs.biome
    pkgs.clang
    pkgs.direnv
    pkgs.docker
    pkgs.devbox
    pkgs.glow
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.nil
    pkgs.podman
    pkgs.python313Packages.python-lsp-server
    pkgs.rubyPackages_3_4.solargraph
    pkgs.rustup
    pkgs.terraform
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
