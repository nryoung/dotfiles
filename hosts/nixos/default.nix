{ inputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    inputs.xremap-flake.nixosModules.default
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # allow for mounting of ntfs volumes
  boot.supportedFilesystems = [ "ntfs" ];

  # Define hostname
  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nixpkgs = {
    overlays = [
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        # Enable flakes and new 'nix' command
        experimental-features = "nix-command flakes";
        # Opinionated: disable global registry
        flake-registry = "";
        # Workaround for https://github.com/NixOS/nix/issues/9574
        nix-path = config.nix.nixPath;
      };

      channel.enable = true;

      # Opinionated: make flake registry and nix path match flake inputs
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

  users.groups.media = { };
  users.users = {
    nic = {
      isNormalUser = true;
      description = "Nic";
      extraGroups = [ "networkmanager" "wheel" "media" ];
      packages = [ inputs.home-manager.packages.${pkgs.system}.default ];
    };
  };

  environment.systemPackages = with pkgs; [
    curl
    git
    jackett
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    just
    wget
  ];

  # Install firefox.
  programs.firefox.enable = true;

  environment.variables.EDITOR = lib.getExe pkgs.helix;
  environment.variables.VISUAL = lib.getExe pkgs.helix;

  # key remap with xremap
  services.xremap = {
    config = {
      modmap = [
        {
          name = "Global";
          remap = {
            # globally remap CapsLock:
            # when held left ctrl
            # when tapped esc
            CapsLock = {
              held = "Ctrl_L";
              alone = "Esc";
              alone_timeout_millis = 1000;
            };
          };
        }
      ];
    };
  };

  # create directory for media
  systemd.tmpfiles.rules = [
    "d /media 0775 nic media -"
    "Z /media 0775 nic media -"
  ];

  # Jellyfin
  # enable Jellyfin
  services.jellyfin = {
    enable = true;
    group = "media";
    openFirewall = true;
  };

  # Jackett
  # enable Jackett, default is ok
  services.jackett = {
    enable = true;
  };

  system.stateVersion = "24.05";
}
