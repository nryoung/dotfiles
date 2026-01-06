{ inputs
, lib
, config
, pkgs
, ...
}: {
  # Define hostname
  networking.hostName = "LMAC-XHQKGYJ-AG";

  # Set your time zone.
  time.timeZone = "America/Denver";

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    # System utilities
    coreutils
    findutils
    git
    vim
  ];

  # Nix configuration (Determinate Nix detected - let it manage the daemon)
  nix.enable = false;

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
    };
  };

  # System settings
  system = {
    # Set Git commit hash for darwin-version.
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

    # Primary user for user-specific settings
    primaryUser = "NYG4";

    defaults = {
      dock = {
        autohide = true;
        orientation = "bottom";
        showhidden = true;
        mru-spaces = false;
      };

      finder = {
        AppleShowAllExtensions = true;
        ShowPathbar = true;
        ShowStatusBar = true;
        FXEnableExtensionChangeWarning = false;
      };

      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
      };

      NSGlobalDomain = {
        # Disable automatic capitalization
        NSAutomaticCapitalizationEnabled = false;
        # Disable smart dashes
        NSAutomaticDashSubstitutionEnabled = false;
        # Disable automatic period substitution
        NSAutomaticPeriodSubstitutionEnabled = false;
        # Disable smart quotes
        NSAutomaticQuoteSubstitutionEnabled = false;
        # Disable auto-correct
        NSAutomaticSpellingCorrectionEnabled = false;
      };
    };
  };

  # Shell configuration
  programs.fish.enable = true;
  programs.zsh.enable = true;

  # Enable homebrew and packages
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    brews = [
      "asdf"
      "bzip2"
      "libffi"
      "openssl"
      "readline"
      "sqlite3"
      "xz"
      "zlib"
    ];
    casks = [
      "alfred"
      "calibre"
      "cryptomator"
      "dbeaver-community"
      "element"
      "firefox@developer-edition"
      "font-fira-code"
      "font-symbols-only-nerd-font"
      "gifcapture"
      "hammerspoon"
      "localsend"
      "moonlight"
      "orbstack"
      "rectangle-pro"
      # "shush"
      "signal"
      "slack"
      "syncthing-app"
      "visual-studio-code"
      "vlc"
      "wezterm"
      "zoom"
    ];
  };

  # Used for backwards compatibility
  system.stateVersion = 5;
}
