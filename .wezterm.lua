local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'Aura (Gogh)'

config.font = wezterm.font ( '0xProto Nerd Font')              -- font 
config.font_size = 10   
config.line_height = 1.3
config.freetype_render_target = 'Light'
config.front_end = "WebGpu"

local colors = {
    GRAY = wezterm.color.parse("#6D6D6D"),
    GREEN = wezterm.color.parse("#61FFCA"),
    PURPLE = wezterm.color.parse("#A277FF"),
    PURPLE_DESATURATE = wezterm.color.parse("#A277FF"):desaturate(0.75):darken(0.5),
    WHITE = wezterm.color.parse("#EDECEE"),
    YELLOW = wezterm.color.parse("#FFCA85"),
    RED = wezterm.color.parse("#FF6767"),
    BLACK = wezterm.color.parse("#110F18"),
    BLACK_LIGHTEN = wezterm.color.parse("#110F18"):lighten(0.2),
    BG = wezterm.color.parse("#14131A"),
    BG_LIGHTEN = wezterm.color.parse("#14131A"):lighten(0.1)
}

-- tab bar

local tab_title = function(tab_info)
    local title = tab_info.tab_title
    if title and #title > 0 then
        return title
    end
    return tab_info.active_pane.title
end

local TAB_EDGE_LEFT = wezterm.nerdfonts.ple_left_half_circle_thick
local TAB_EDGE_RIGHT = wezterm.nerdfonts.pl_left_hard_divider

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_max_width = 150

local tab_bar_config_colors = {
    background = "transparent",
    new_tab = {
        bg_color = colors.BG_LIGHTEN,
        fg_color = colors.GREEN
    }
}

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local title = tab_title(tab)
    title = ' ' .. title .. ' '
    local tab_bar_background = "transparent"
    local background = colors.BG_LIGHTEN
    local foreground = colors.GRAY
    local separator_color = colors.BG_LIGHTEN
    local intensity = "Normal"
    local tab_bar_left = ""

    if tab.is_active then
        foreground = colors.WHITE
        intensity = "Bold"
    elseif hover then
        foreground = colors.WHITE
    end

    if tab.tab_index == 0 then
        tab_bar_left = " 🦈 "
    end

    return { -- tab bar left
    {
        Background = {
            Color = tab_bar_background
        }
    }, {
        Foreground = {
            Color = background
        }
    }, {
        Text = tab_bar_left
    }, -- left
    {
        Background = {
            Color = tab_bar_background
        }
    }, {
        Foreground = {
            Color = background
        }
    }, {
        Text = TAB_EDGE_LEFT
    }, -- center
    {
        Foreground = {
            Color = foreground
        }
    }, {
        Background = {
            Color = background
        }
    }, {
        Attribute = {
            Intensity = intensity
        }
    }, {
        Text = tab.tab_index + 1 .. ". " .. wezterm.nerdfonts.dev_terminal_badge .. " " .. title
    }, -- right
    {
        Background = {
            Color = tab_bar_background
        }
    }, {
        Foreground = {
            Color = background
        }
    }, {
        Text = TAB_EDGE_RIGHT
    }, {
        Background = {
            Color = tab_bar_background
        }
    }, {
        Foreground = {
            Color = separator_color
        }
    }, {
        Attribute = {
            Italic = false
        }
    }, {
        Text = " "
    }}
end)

-- panes

config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8
}

-- background

config.background = {{
    source = {
        Color = colors.BG:darken(0.3):saturate(0.2)
    },
    width = "100%",
    height = "100%",
    opacity = 1.0
}, {
    source = {
        File = wezterm.home_dir .. '/wezterm_bg.jpg'
    },
    width = '100%',
    repeat_x = 'NoRepeat',
    vertical_align = 'Middle',
    attachment = {
        Parallax = 0
    },
    opacity = 0.01
}}

-- window
config.macos_window_background_blur = 10
config.window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 20
}
config.window_decorations = "RESIZE"

-- control
config.keys = {{
    key = '_',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitVertical {
        domain = 'CurrentPaneDomain'
    }
}, {
    key = '|',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitHorizontal {
        domain = 'CurrentPaneDomain'
    }
}, {
    key = 'w',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentTab {
        confirm = true
    }
}}

-- export
config.colors = {
    tab_bar = tab_bar_config_colors
}

return config
