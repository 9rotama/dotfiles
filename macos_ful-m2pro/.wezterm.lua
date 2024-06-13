local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end


config.color_scheme = 'Aura (Gogh)'
config.font_size = 13.0

-- tab bar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_max_width = 50

config.colors = {
  tab_bar = {
    background = "#14131A",
    active_tab = {
      bg_color = '#14131A',
      fg_color = '#EDECEE',
    },
    inactive_tab = {
      bg_color = "#24232A",
      fg_color = '#6D6D6D'
    },
    new_tab = {
      bg_color = "#24232A",
      fg_color = '#A277FF'
    },
  }
}

config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.5,
}


-- background
config.background = {
  {
    source = {
      Color = "#14131A"
    },
    width = "100%",
    height = "100%",
    opacity = 0.9
  },
  {
    source = {
      File = '/Users/aoi.meguro/Pictures/backgrounds/sansukumi.jpg',
    },
    repeat_x = 'NoRepeat',
    width = "100%",
    vertical_align = 'Middle',
    horizontal_align = 'Middle',
    attachment = { Parallax = 0 },
    opacity = 0.1
  },
}


-- window

config.macos_window_background_blur = 10
-- control


return config
