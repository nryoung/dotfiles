local wezterm = require 'wezterm'

return {
  color_scheme = 'tokyonight',
  automatically_reload_config = true,
  enable_tab_bar = false,
  enable_wayland= false,
  font = wezterm.font_with_fallback { 'FiraCode', 'FiraCode NFM' },
}
