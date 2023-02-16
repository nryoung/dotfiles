local wezterm = require 'wezterm'

return {
  default_prog = { '/opt/homebrew/bin/fish', '-l' },
  color_scheme = 'tokyonight_night',
  automatically_reload_config = true,
  font = wezterm.font 'FiraCode NFM',
}
