local wezterm = require 'wezterm'

return {
  color_scheme = 'Tokyo Night',
  automatically_reload_config = true,
  -- enable_tab_bar = false,
  font = wezterm.font 'FiraCode',
  font_size = 10,
  -- to fix this issue: https://github.com/wez/wezterm/issues/5990
  -- front_end = "WebGpu",
  -- webgpu_power_preference = 'HighPerformance',
}
