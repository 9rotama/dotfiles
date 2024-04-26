local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end


-- _______ _
-- |__   __| |
--    | |  | |__   ___ _ __ ___   ___
--    | |  | '_ \ / _ \ '_ ` _ \ / _ \
--    | |  | | | |  __/ | | | | |  __/
--    |_|  |_| |_|\___|_| |_| |_|\___|


config.color_scheme = 'nord'
local dimmer = { brightness = 0.01 }

config.background = {
  {
    source = {
      File = 'wezterm/term-bgb.jpeg'
    },
    hsb = dimmer,
    attachment = { Parallax = 0.005 },
  },
  {
    source = {
      Color = '#2E3440'
    },
    width = "100%",
    height = "100%",
    opacity = 0.6
  },

}

config.window_frame = {
  inactive_titlebar_bg = '#000202',
  active_titlebar_bg = '#000202',
  inactive_titlebar_fg = '#cccccc',
  active_titlebar_fg = '#ffffff',
  inactive_titlebar_border_bottom = '#2b2042',
  active_titlebar_border_bottom = '#2b2042',
  button_fg = '#cccccc',
  button_bg = '#2b2042',
  button_hover_fg = '#ffffff',
  button_hover_bg = '#3b3052',
  font = wezterm.font('Nerd Font Symbols', { weight = 'Bold', italic = true }),
  font_size = 11
}
config.window_decorations = "RESIZE"

-- ______          _
-- |  ____|        | |
-- | |__ ___  _ __ | |_
-- |  __/ _ \| '_ \| __|
-- | | | (_) | | | | |_
-- |_|  \___/|_| |_|\__|

config.freetype_load_flags = "NO_HINTING"
config.freetype_load_target = "Light"
config.font = wezterm.font('Iosevka', { weight = "Medium" })
config.font_size = 10.5
config.foreground_text_hsb = {
  hue = 1.0,
  saturation = 1.0,
  brightness = 1.5,
}

config.window_padding = {
  left = 15,
  right = 15,
  top = 15,
  bottom = 15,
}

config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = 'd',
    mods = 'ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
}

return config
