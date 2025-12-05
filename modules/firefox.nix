{ config, lib, pkgs, inputs, ... }: {
  programs.firefox = {
    enable = true;

    package = pkgs.firefox-devedition;

    profiles.dev-edition-default = {
      extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
        onepassword-password-manager
        dearrow
        instapaper-official
        multi-account-containers
        react-devtools
        reduxdevtools
        refined-github
        simple-tab-groups
        sponsorblock
        ublock-origin
        vimium
        youtube-recommended-videos
      ];
    };
  };
}
