{ config, lib, pkgs, ... }: {
  programs.retroarch = {
    enable = true;
    cores = {
      nestopia.enable = true;
      snes9x.enable = true;
      mupen64plus.enable = true;
      beetle-psx-hw.enable = true;
      pcsx2.enable = true;
      dolphin.enable = true;
      vice-x64.enable = true;
      dosbox-pure.enable = true;
    };
    settings = {
      video_fullscreen = "true";
    };
  };
}
