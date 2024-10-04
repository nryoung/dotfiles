local wezterm = require 'wezterm'
local act = wezterm.action

return {
  default_prog = { '/usr/bin/fish', '-l' },
  color_scheme = 'tokyonight_night',
  automatically_reload_config = true,
  font = wezterm.font 'FiraCode',
  keys = {
    -- paste from the clipboard
    { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
    -- paste from primary selection
    { key = 'v', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection' },
  }
}
