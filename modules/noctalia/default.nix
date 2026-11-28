{ inputs, lib, config, pkgs, ... }: {
  programs.noctalia = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile ./config.toml);
  };
}
