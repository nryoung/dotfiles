{ config, pkgs, ... }:

{
  # Thunar custom actions for archive operations
  xdg.configFile."Thunar/uca.xml" = {
    force = true;
    text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <actions>
        <action>
          <icon>document-properties</icon>
          <name>Extract Here</name>
          <unique-id>extract-here</unique-id>
          <description>Extract archive to current folder</description>
          <patterns>*.zip;*.tar;*.tar.gz;*.tar.bz2;*.7z;*.rar</patterns>
          <exec>xarchiver --extract-here %f</exec>
          <conditions>
            <condition compare-type="token" condition-type="mime-type">application/zip</condition>
            <condition compare-type="token" condition-type="mime-type">application/x-tar</condition>
            <condition compare-type="token" condition-type="mime-type">application/x-compressed-tar</condition>
            <condition compare-type="token" condition-type="mime-type">application/x-bzip-compressed-tar</condition>
            <condition compare-type="token" condition-type="mime-type">application/x-7z-compressed</condition>
            <condition compare-type="token" condition-type="mime-type">application/x-rar</condition>
          </conditions>
        </action>
        <action>
          <icon>document-properties</icon>
          <name>Compress...</name>
          <unique-id>compress</unique-id>
          <description>Compress selected files into an archive</description>
          <exec>xarchiver --add %f</exec>
          <conditions>
            <condition compare-type="token" condition-type="file-type">regular</condition>
            <condition compare-type="token" condition-type="file-type">directory</condition>
          </conditions>
        </action>
      </actions>
    '';
  };

  xdg.configFile."gtkrc-2.0" = {
    force = true;
    text = ''
      gtk-theme-name="Adwaita-dark"
      gtk-icon-theme-name="Papirus-Dark"
      gtk-cursor-theme-name="Bibata-Modern-Ice"
      gtk-cursor-theme-size=22
      gtk-application-prefer-dark-theme=true
    '';
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 22;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.theme = config.gtk.theme;
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  # Ensure XDG directories exist
  xdg.enable = true;
}

