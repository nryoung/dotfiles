{ config, lib, pkgs, ... }: {
  services.qbittorrent = {
    enable = true;
    serverConfig = {
      "BitTorrent" = {
        "Session\DefaultSavePath" = "/media";
        "Session\Interface" = "protonvpn";
        "Session\InterfaceName" = "protonvpn";
        "Session\Port" = "11714";
        "Session\SSL\Port" = "57920";
      };
      "LegalNotice" = {
        "Accepted" = "true";
      };
      "Preferences" = {
        "WebUI\Enabled" = true;
        "WebUI\Port" = "8083";
      };
    };
  };
}
