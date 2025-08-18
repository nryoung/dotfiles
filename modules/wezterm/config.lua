local wezterm = require 'wezterm'

return {
  color_scheme = 'tokyonight',
  automatically_reload_config = true,
  enable_tab_bar = false,
  enable_wayland= false,
  font = wezterm.font_with_fallback { 'FiraCode NFM', 'FiraCode' },
  -- to fix this issue: https://github.com/wez/wezterm/issues/5990
  -- front_end = "WebGpu",
  -- webgpu_power_preference = 'HighPerformance',
}
