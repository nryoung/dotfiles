{ lib, config, pkgs, ... }: {

  programs.niri = {
    settings = {
      # Keybinds — Mod is Super/Win key
      binds = with config.lib.niri.actions; {
        "Mod+Return".action = { spawn = [ "wezterm" ]; };
        "Mod+D".action = { spawn = [ "fuzzel" ]; };
        "Mod+Q".action = { close-window = { }; };
        "Mod+Shift+E".action = { quit = { }; };

        "Mod+H".action = { focus-column-left = { }; };
        "Mod+L".action = { focus-column-right = { }; };
        "Mod+J".action = { focus-window-down = { }; };
        "Mod+K".action = { focus-window-up = { }; };
        "Mod+Left".action = { focus-column-left = { }; };
        "Mod+Right".action = { focus-column-right = { }; };
        "Mod+Down".action = { focus-window-down = { }; };
        "Mod+Up".action = { focus-window-up = { }; };

        "Mod+Shift+H".action = { move-column-left = { }; };
        "Mod+Shift+L".action = { move-column-right = { }; };
        "Mod+Shift+J".action = { move-window-down = { }; };
        "Mod+Shift+K".action = { move-window-up = { }; };

        "Mod+1".action = { focus-workspace = 1; };
        "Mod+2".action = { focus-workspace = 2; };
        "Mod+3".action = { focus-workspace = 3; };
        "Mod+4".action = { focus-workspace = 4; };
        "Mod+5".action = { focus-workspace = 5; };

        "Mod+Shift+1".action = { move-column-to-workspace = 1; };
        "Mod+Shift+2".action = { move-column-to-workspace = 2; };
        "Mod+Shift+3".action = { move-column-to-workspace = 3; };
        "Mod+Shift+4".action = { move-column-to-workspace = 4; };
        "Mod+Shift+5".action = { move-column-to-workspace = 5; };

        "Mod+F".action = { fullscreen-window = { }; };

        "Print".action = { screenshot = { }; };
        "Mod+Shift+S".action = { screenshot-screen = { }; };

        # Resize windows
        "Mod+R".action = { switch-preset-column-width = { }; };
        "Mod+Shift+R".action = { reset-window-height = { }; };
        "Mod+Minus".action = { set-column-width = "-10%"; };
        "Mod+Equal".action = { set-column-width = "+10%"; };
        "Mod+Shift+Minus".action = { set-window-height = "-10%"; };
        "Mod+Shift+Equal".action = { set-window-height = "+10%"; };

        # map brightness
        "XF86MonBrightnessUp".action.spawn = [ "noctalia-shell" "ipc" "call" "brightness" "increase" ];
        "XF86MonBrightnessDown".action.spawn = [ "noctalia-shell" "ipc" "call" "brightness" "decrease" ];

        # map volume
        "XF86AudioRaiseVolume".action.spawn = [ "noctalia-shell" "ipc" "call" "volume" "increase" ];
        "XF86AudioLowerVolume".action.spawn = [ "noctalia-shell" "ipc" "call" "volume" "decrease" ];
        "XF86AudioMute".action.spawn = [ "noctalia-shell" "ipc" "call" "volume" "muteOutput" ];
        "XF86AudioMicMute".action.spawn = [ "noctalia-shell" "ipc" "call" "volume" "muteInput" ];

        # map play/pause
        "XF86AudioPlay".action.spawn = [ "noctalia-shell" "ipc" "call" "media" "togglePlaying" ];

        # toggle overview
        "Alt+Tab".action = { toggle-overview = { }; };
      };

      # Startup applications
      spawn-at-startup = [
        { command = [ "noctalia-shell" ]; }
        { command = [ "xwayland-satellite" ]; }
      ];

      # Input settings
      input = {
        keyboard.xkb.layout = "us";
        touchpad = {
          tap = true;
          natural-scroll = false;
        };
      };

      # Layout settings
      layout = {
        gaps = 8;
        border = {
          width = 2;
          active = "#89b4fa"; # Catppuccin blue
          inactive = "#313244"; # Catppuccin surface
        };
      };

      # Animations
      animations.enable = true;

      # Env vars
      environment = {
        QT_QPA_PLATFORM = "wayland";
        QT_QPA_PLATFORMTHEME = "gtk3";
      };

      # Set resolution and scale
      outputs."eDP-1" = {
        mode = {
          width = 3456;
          height = 2160;
          refresh = 60.0;
        };
        scale = 2.0;
      };
    };
  };
}
