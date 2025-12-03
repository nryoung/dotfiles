{ config, lib, pkgs, ... }: {
  services.qbittorrent = {
    enable = true;
    group = "media";
    serverConfig = {
      BitTorrent = {
        Session = {
          DefaultSavePath = "/media";
          Interface = "protonvpn";
          InterfaceName = "protonvpn";
          Port = 11714;
          QueueingSystemEnabled = false;
          SSL = {
            Port = 57920;
          };
        };
      };
      LegalNotice = {
        Accepted = true;
      };
      Preferences = {
        WebUI = {
          Enabled = true;
          Port = 8080;
          Username = "admin";
          Password_PBKDF2 = "@ByteArray(gv8t9SdIz9N+J09wG+kUTQ==:ez/QBEM8e+/c4D6OVRnNcFyrHTSzIx+MK+WJ0uPP1hjeiUI3MD9KkIocHTi/I5O0UYF09Oxl0xuNsAWLY9LTKQ==)";
        };
      };
    };
  };
}
