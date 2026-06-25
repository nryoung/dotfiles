{ lib, config, pkgs, inputs, ... }: {

  imports = [ inputs.niri-flake.homeModules.default ];

  wayland.windowManager.niri = {
    enable = true;
    settings = {

      input = {
        keyboard.xkb.layout = "us";
        touchpad = {
          tap._args = [ ];
        };
      };

      output = [
        {
          _args = [ "eDP-1" ];
          scale = 2.0;
        }
      ];

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      prefer-no-csd._args = [ ];

      layout = {
        gaps = 8;
        focus-ring = {
          on._args = [ ];
          width = 2;
          active-color._args = [ "#89b4fa" ];
          inactive-color._args = [ "#313244" ];
        };
        preset-column-widths._children = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
          { proportion = 1.0; }
        ];
        default-column-width = { };
      };

      spawn-at-startup = [
        { _args = [ "noctalia" ]; }
        { _args = [ "xwayland-satellite" ]; }
      ];

      window-rule = [
        {
          geometry-corner-radius = 20;
          clip-to-geometry = true;
          match = {
            _props.app-id = "dev.noctalia.Noctalia.Settings";
          };
          open-floating = true;
          default-column-width = {
            fixed = 1080;
          };
          default-window-height = {
            fixed = 920;
          };
        }
      ];

      layer-rule = [
        {
          match = {
            _props.namespace = "^noctalia-backdrop";
          };
          place-within-backdrop = true;
        }
      ];

      binds = {
        "Mod+Return".spawn = "wezterm";
        "Mod+Space"."spawn-sh" = "noctalia msg panel-toggle launcher";
        "Mod+C"."spawn-sh" = "noctalia msg panel-toggle control-center";
        "Mod+Comma"."spawn-sh" = "noctalia msg settings-toggle";
        "Mod+P"."spawn-sh" = "noctalia msg panel-toggle session";
        "Mod+V"."spawn-sh" = "noctalia msg panel-toggle clipboard";
        "Mod+Q"."close-window" = [ ];
        "Mod+Shift+E".quit = [ ];
        "Alt+Tab"."toggle-overview" = [ ];
        "Mod+W"."toggle-overview" = [ ];

        "Mod+H"."focus-column-left" = [ ];
        "Mod+L"."focus-column-right" = [ ];
        "Mod+J"."focus-window-down" = [ ];
        "Mod+K"."focus-window-up" = [ ];
        "Mod+Left"."focus-column-left" = [ ];
        "Mod+Right"."focus-column-right" = [ ];
        "Mod+Down"."focus-workspace-down" = [ ];
        "Mod+Up"."focus-workspace-up" = [ ];

        "Mod+Shift+H"."move-column-left" = [ ];
        "Mod+Shift+L"."move-column-right" = [ ];
        "Mod+Shift+J"."move-window-down" = [ ];
        "Mod+Shift+K"."move-window-up" = [ ];

        "Mod+1"."focus-workspace" = 1;
        "Mod+2"."focus-workspace" = 2;
        "Mod+3"."focus-workspace" = 3;
        "Mod+4"."focus-workspace" = 4;
        "Mod+5"."focus-workspace" = 5;

        "Mod+Shift+1"."move-window-to-workspace" = 1;
        "Mod+Shift+2"."move-window-to-workspace" = 2;
        "Mod+Shift+3"."move-window-to-workspace" = 3;
        "Mod+Shift+4"."move-window-to-workspace" = 4;
        "Mod+Shift+5"."move-window-to-workspace" = 5;

        "Mod+F"."fullscreen-window" = [ ];
        "Mod+R"."switch-preset-column-width" = [ ];
        "Mod+Shift+R"."reset-window-height" = [ ];
        "Mod+Minus"."set-column-width" = "-10%";
        "Mod+Equal"."set-column-width" = "+10%";
        "Mod+Shift+Minus"."set-window-height" = "-10%";
        "Mod+Shift+Equal"."set-window-height" = "+10%";

        "Print".screenshot = [ ];
        "Mod+Shift+S"."screenshot-screen" = [ ];

        "XF86MonBrightnessUp"."spawn-sh" = "noctalia msg brightness-up";
        "XF86MonBrightnessDown"."spawn-sh" = "noctalia msg brightness-down";
        "XF86AudioRaiseVolume"."spawn-sh" = "noctalia msg volume-up";
        "XF86AudioLowerVolume"."spawn-sh" = "noctalia msg volume-down";
        "XF86AudioMute"."spawn-sh" = "noctalia msg volume-mute";
        "XF86AudioMicMute"."spawn-sh" = "noctalia msg volume muteInput";
        "XF86AudioPlay"."spawn-sh" = "noctalia msg media togglePlaying";
        "XF86AudioPrev"."spawn-sh" = "noctalia msg media previous";
        "XF86AudioNext"."spawn-sh" = "noctalia msg media next";
      };

      cursor = {
        xcursor-theme = [ "Nordzy-cursors" ];
        xcursor-size = [ 24 ];
        hide-when-typing = true;
      };
      switch-events = {
        lid-close.spawn = [ "noctalia" "msg" "session" "lock-and-suspend" ];
      };
    };
  };
}
