{ inputs
, lib
, config
, pkgs
, ...
}: {
  # Define hostname
  networking.hostName = "HLGXHQKGYJ";

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
    primaryUser = "nyoung";

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
    ];
    casks = [
      "alfred"
      "calibre"
      "font-fira-code"
      "font-symbols-only-nerd-font"
      "gifcapture"
      "hammerspoon"
      "rectangle-pro"
      # "shush"
      "signal"
      # "slack"
      "syncthing-app"
      # "zoom"
    ];
  };

  # Used for backwards compatibility
  system.stateVersion = 5;
}
