{ inputs, ... }:

{
  imports = [ inputs.erosanix.nixosModules.protonvpn ];
  services.protonvpn = {
    enable = true;
    autostart = true;
    interface = {
      ip = "10.2.0.2/32";
      port = 51820;
      privateKeyFile = "/etc/protonvpn.key";
      dns = {
        enable = true;
        ip = "10.2.0.1";
      };
    };
    endpoint = {
      port = 51820;
      # main
      publicKey = "YSj10LI8/Im58sgiA7n6Szw96GgE0p3TZv3MfbkxZH0=";
      ip = "95.173.221.33";
    };
  };
}
