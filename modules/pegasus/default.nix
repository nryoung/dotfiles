{ config, lib, pkgs, ... }:
let
  systems = [ "nes" "snes" "n64" "psx" "ps2" "ps3" "gc" "c64" "dos" ];
in {
  home.file = {
    ".local/bin/pegasus-wrapper.sh" = { source = ./pegasus-wrapper.sh; executable = true; };
    ".local/bin/scrape-all.sh" = { source = ./scrape-all.sh; executable = true; };

    ".config/pegasus-frontend/settings.txt".text = ''
      general.fullscreen: true
      general.input-mouse-support: true
      general.locale: en
      general.theme: pegasus-grid
      providers.steam.enabled: true
      providers.steam.source: ~/.local/share/Steam
    '';

    ".config/pegasus-frontend/game_dirs.txt".text =
      lib.concatMapStringsSep "\n" (s: "/media/Games/${s}") systems + "\n";

    ".config/sunshine/apps.json".text = builtins.toJSON {
      env = {};
      apps = [
        { name = "Pegasus"; cmd = "/home/nic/.local/bin/pegasus-wrapper.sh"; }
        { name = "Desktop"; cmd = ""; }
      ];
    };

    ".config/pegasus-frontend/metafiles/nes.metadata.pegasus.txt".source = ./metadata/nes.txt;
    ".config/pegasus-frontend/metafiles/snes.metadata.pegasus.txt".source = ./metadata/snes.txt;
    ".config/pegasus-frontend/metafiles/n64.metadata.pegasus.txt".source = ./metadata/n64.txt;
    ".config/pegasus-frontend/metafiles/psx.metadata.pegasus.txt".source = ./metadata/psx.txt;
    ".config/pegasus-frontend/metafiles/ps2.metadata.pegasus.txt".source = ./metadata/ps2.txt;
    ".config/pegasus-frontend/metafiles/ps3.metadata.pegasus.txt".source = ./metadata/ps3.txt;
    ".config/pegasus-frontend/metafiles/gc.metadata.pegasus.txt".source = ./metadata/gc.txt;
    ".config/pegasus-frontend/metafiles/c64.metadata.pegasus.txt".source = ./metadata/c64.txt;
    ".config/pegasus-frontend/metafiles/dos.metadata.pegasus.txt".source = ./metadata/dos.txt;
  };
}
