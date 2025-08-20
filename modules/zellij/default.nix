{ config, lib, pkgs, ... }: {
  programs.zellij = {
    enable = true;

  };
  xdg.configFile."zellij/config.kdl".source = pkgs.replaceVars ./config/config.kdl {
    notesPath = if pkgs.stdenv.isDarwin then "~/Workspace/notes" else "/notes";
  };
}
