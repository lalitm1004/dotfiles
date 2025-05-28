local wezterm = require 'wezterm'

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return {
  color_scheme = "Flexoki Dark",

  font_size = 10.0,

  window_padding = {
    left = 0,
    right = 0,
    bottom = 0,
    top = 0,
  },

  background = {
    {
      source = {
        File = "/home/lalit/.config/wallpapers/outerwilds-dark.jpg",
      },
      hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 0.8
      },
      width = "Cover",
      height = "Cover",
      opacity = 1,
    },
  },
}