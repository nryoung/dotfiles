{ config, lib, pkgs, ... }: {
  services.audiobookshelf = {
    enable = true;
    host = "10.0.0.99";
    port = 8083;
    group = "media";
    openFirewall = true;
  };
}
