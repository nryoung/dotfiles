{ inputs, lib, config, pkgs, ... }: {

  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell = {
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
    };
  };
}
