{ config, lib, pkgs, ... }: {
  services.calibre-web = {
    enable = true;
    package = pkgs.calibre-web.overridePythonAttrs (old: rec {
      dependencies = old.dependencies ++ old.optional-dependencies.kobo;
    });
    listen = {
      ip = "10.0.0.99";
      port = 8082;
    };
    options = {
      calibreLibrary = /media/Books;
      enableBookUploading = true;
    };
    group = "media";
    openFirewall = true;
  };
}
