{ config, lib, pkgs, inputs, ... }: {
  programs.firefox = {
    enable = true;

    package = pkgs.firefox-devedition;

    profiles.dev-edition-default = {
      settings = {
        "browser.startup.page" = 3;
        "browser.sessionstore.resume_from_crash" = true;
        "browser.sessionstore.max_resumed_crashes" = -1;
      };

      extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
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
