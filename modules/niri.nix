{ lib, config, pkgs, inputs, ... }: {

  imports = [ inputs.niri-flake.homeModules.default ];

  wayland.windowManager.niri = {
    settings = {
      input = {
        keyboard.xkb.layout = "us";
        touchpad = {
          tap = true;
          natural-scroll = false;
        };
      };

      outputs._children = [
        {
          _args = [ "eDP-1" ];
          scale = 1.0;
        }
      ];

      layout = {
        gaps = 8;
        border._props = {
          width = 2;
          active-color = "#89b4fa";
          inactive-color = "#313244";
        };
        preset-column-widths._children = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
          { proportion = 1.0; }
        ];
        default-column-width._props.proportion = 0.5;
      };

      cursor = {
        theme = "Adwaita";
        size = 24;
      };

      spawn-at-startup._children = [
        { _args = [ "noctalia-shell" ]; }
        { _args = [ "xwayland-satellite" ]; }
      ];

      binds = {
        "Mod+Return".action.spawn = [ "foot" ];
        "Mod+D".action.spawn = [ "fuzzel" ];
        "Mod+Q".action.close-window = { };
        "Mod+Shift+E".action.quit = { };
        "Alt+Tab".action.toggle-overview = { };
        "Mod+W".action.toggle-overview = { };

        "Mod+H".action.focus-column-left = { };
        "Mod+L".action.focus-column-right = { };
        "Mod+J".action.focus-window-down = { };
        "Mod+K".action.focus-window-up = { };
        "Mod+Left".action.focus-column-left = { };
        "Mod+Right".action.focus-column-right = { };
        "Mod+Down".action.focus-window-down = { };
        "Mod+Up".action.focus-window-up = { };

        "Mod+Shift+H".action.move-column-left = { };
        "Mod+Shift+L".action.move-column-right = { };
        "Mod+Shift+J".action.move-window-down = { };
        "Mod+Shift+K".action.move-window-up = { };

        "Mod+1".action.focus-workspace._args = [ 1 ];
        "Mod+2".action.focus-workspace._args = [ 2 ];
        "Mod+3".action.focus-workspace._args = [ 3 ];
        "Mod+4".action.focus-workspace._args = [ 4 ];
        "Mod+5".action.focus-workspace._args = [ 5 ];

        "Mod+Shift+1".action.move-column-to-workspace._args = [ 1 ];
        "Mod+Shift+2".action.move-column-to-workspace._args = [ 2 ];
        "Mod+Shift+3".action.move-column-to-workspace._args = [ 3 ];
        "Mod+Shift+4".action.move-column-to-workspace._args = [ 4 ];
        "Mod+Shift+5".action.move-column-to-workspace._args = [ 5 ];

        "Mod+F".action.fullscreen-window = { };
        "Mod+R".action.switch-preset-column-width = { };
        "Mod+Shift+R".action.reset-window-height = { };
        "Mod+Minus".action.set-column-width._args = [ "-10%" ];
        "Mod+Equal".action.set-column-width._args = [ "+10%" ];
        "Mod+Shift+Minus".action.set-window-height._args = [ "-10%" ];
        "Mod+Shift+Equal".action.set-window-height._args = [ "+10%" ];

        "Print".action.screenshot = { };
        "Mod+Shift+S".action.screenshot-screen = { };

        "XF86MonBrightnessUp".action.spawn = [ "noctalia-shell" "ipc" "call" "brightness" "increase" ];
        "XF86MonBrightnessDown".action.spawn = [ "noctalia-shell" "ipc" "call" "brightness" "decrease" ];
        "XF86AudioRaiseVolume".action.spawn = [ "noctalia-shell" "ipc" "call" "volume" "increase" ];
        "XF86AudioLowerVolume".action.spawn = [ "noctalia-shell" "ipc" "call" "volume" "decrease" ];
        "XF86AudioMute".action.spawn = [ "noctalia-shell" "ipc" "call" "volume" "muteOutput" ];
        "XF86AudioMicMute".action.spawn = [ "noctalia-shell" "ipc" "call" "volume" "muteInput" ];
        "XF86AudioPlay".action.spawn = [ "noctalia-shell" "ipc" "call" "media" "togglePlaying" ];
        "XF86AudioPrev".action.spawn = [ "noctalia-shell" "ipc" "call" "media" "previous" ];
        "XF86AudioNext".action.spawn = [ "noctalia-shell" "ipc" "call" "media" "next" ];
      };

      animations.enable = true;
    };
  };
}
