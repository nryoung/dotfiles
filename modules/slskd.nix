{ config, lib, pkgs, ... }: {
  services.slskd = {
    enable = true;
    domain = "10.0.0.99";
    environmentFile = "/home/nic/slskd.env";
    group = "media";
    user = "nic";
    openFirewall = true;
    settings = {
      soulseek = {
        description = "You can't stop the signal.";
      };
      directories = {
        downloads = "/media/Sort";
      };
      web = {
        port = 8081;
      };
      shares = {
        directories = [ "/media/Movies" "/media/Books" "/media/Shows" "/media/Music" "/media/Audio Books" ];
      };
    };
  };
}
