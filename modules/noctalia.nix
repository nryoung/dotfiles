{ inputs, lib, config, pkgs, ... }: {

  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;
    settings = {
      colorSchemes = {
        predefinedScheme = "Tokyo Night";
        darkMode = true;
      };
      bar = {
        position = "top";
        backgroundOpacity = 0.92;
        widgets = {
          left = [
            { id = "Launcher"; }
            { id = "ActiveWindow"; }
          ];
          center = [
            { id = "Workspace"; hideUnoccupied = true; }
          ];
          right = [
            { id = "Tray"; }
            { id = "Volume"; }
            { id = "Network"; }
            { id = "Bluetooth"; }
            { id = "Battery"; }
            { id = "ControlCenter"; }
            { id = "Clock"; formatHorizontal = "HH:mm EEE, MMM d"; }
          ];
        };
      };
      idle = {
        behavior = {
          lock = {

            timeout = 600; # 10 min
            command = "noctalia:session lock";
            enabled = true;
          };
          screen-off = {
            timeout = 660;
            command = "noctalia:dpms-off";
            resume_command = "noctalia:dpms-on";
            enabled = true;
          };
        };
      };
    };
  };
}
