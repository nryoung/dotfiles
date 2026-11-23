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
      genesis-plus-gx.enable = true;
    };
    settings = {
      video_fullscreen = "true";
      frontend_log_level = "0";
      log_to_file = "true";
      log_verbosity = "true";
      input_menu_toggle_gamepad_combo = "4";
    };
  };

  xdg.configFile."retroarch/config/LRPS2/LRPS2.opt".text = ''
    pcsx2_renderer = "Vulkan"
  '';
}
