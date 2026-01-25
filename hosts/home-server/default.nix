{ inputs
, lib
, config
, pkgs
, ...
}: {
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/protonvpn.nix
      ../../modules/qbittorrent.nix
      ../../modules/slskd.nix
      ../../modules/calibre-web.nix
      ../../modules/audiobookshelf.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "home-server"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;

  # Statically setting the IP address
  networking = {
    interfaces = {
      wlp8s0.ipv4.addresses = [{
        address = "10.0.0.99";
        prefixLength = 24;
      }];
    };
  };

  # Allow certain ports through the firewall
  # networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [
    80
    443
    8080
    8081
    8082
    8083
    8384
    47984
    47989
    47990
    48010
    50300
  ];

  networking.firewall.allowedUDPPortRanges = [
    { from = 47998; to = 48000; }
    { from = 8000; to = 8010; }
  ];

  # Gnome
  services.displayManager.gdm = {
    enable = true;

  };
  services.desktopManager.gnome.enable = true;

  # Enable RDP
  services.xrdp.enable = true;
  # Use the GNOME Wayland session
  services.xrdp.defaultWindowManager = "${pkgs.gnome-session}/bin/gnome-session";
  # XRDP needs the GNOME remote desktop backend to function
  services.gnome.gnome-remote-desktop.enable = true;
  # Open the default RDP port (3389)
  services.xrdp.openFirewall = true;
  # Disable autologin to avoid session conflicts
  services.displayManager.autoLogin.enable = false;
  services.getty.autologinUser = null;

  # NVIDIA
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    open = true;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Define groups
  users.groups.media = { };
  users.groups.syncthing = { };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nic = {
    isNormalUser = true;
    description = "nic";
    extraGroups = [ "networkmanager" "wheel" "media" "syncthing" ];
    packages = [ inputs.home-manager.packages.${pkgs.system}.default ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    curl
    git
    helix
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    just
  ];

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [ "nic" ];
      PermitRootLogin = "no";
    };
  };

  # Disable sleep, suspend and hibernate
  systemd = {
    targets = {
      sleep = {
        enable = false;
        unitConfig.DefaultDependencies = "no";
      };
      suspend = {
        enable = false;
        unitConfig.DefaultDependencies = "no";
      };
      hibernate = {
        enable = false;
        unitConfig.DefaultDependencies = "no";
      };
      "hybrid-sleep" = {
        enable = false;
        unitConfig.DefaultDependencies = "no";
      };
    };
  };

  # Jellyfin 
  services.jellyfin = {
    enable = true;
    group = "media";
    openFirewall = true;
  };

  # Create directories for services like jellyfin, syncthing, etc...
  systemd.tmpfiles.rules = [
    "d /media 0775 nic media -"
    "Z /media 0775 nic media -"
    "d /syncthing 1777 nic syncthing -"
    "Z /syncthing 1777 nic syncthing -"
  ];

  # Syncthing
  users.users.syncthing.extraGroups = [ "users" ];
  users.users.syncthing.group = "syncthing";
  users.users.syncthing.isNormalUser = true;
  systemd.services.syncthing.serviceConfig.UMask = "0007";
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    guiAddress = "0.0.0.0:8384";
    user = "nic";
    group = "syncthing";
    dataDir = "/syncthing";
  };

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
