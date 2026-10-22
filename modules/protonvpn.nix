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
      publicKey = "EGo/2dw+hLWyYyRhLA8GDBihfxQ9KEWu0jTPKTK4Qm0=";
      ip = "95.173.221.221";
    };
  };
}
