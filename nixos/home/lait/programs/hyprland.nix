{ inputs, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;

    configType = "lua";

    extraConfig = ''
      ---- MONITORS ----
      hl.monitor({
          output   = "",
          mode     = "preferred",
          position = "auto",
          scale    = 1.5,
      })

      ---- MY PROGRAMS ----
      local terminal    = "kitty"
      local menu        = "fuzzel"
      local fileManager = "dolphin"

      ---- AUTOSTART ----
      hl.on("hyprland.start", function()
          hl.exec_cmd("waybar")
          hl.exec_cmd("mako")
          hl.exec_cmd("awww-daemon")
          hl.exec_cmd("hypridle")
          hl.exec_cmd("hyprpolkitagent")
          hl.exec_cmd("wl-paste --watch cliphist store")
      end)

      ---- ENVIRONMENT VARIABLES ----
      hl.env("XCURSOR_SIZE", "24")
      hl.env("HYPRCURSOR_SIZE", "24")
      hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")

      ---- LOOK AND FEEL ----
      hl.config({
          general = {
              gaps_in = 2,
              gaps_out = 2,
              border_size = 1,

              col = {
                    active_border = "rgba(2371b2ee)",
                    inactive_border = "rgba(231f20ff)",
                },


              resize_on_border = true,
              allow_tearing = false,
              layout = "dwindle",
          },

          decoration = {
              rounding = 4,

              active_opacity = 1.0,
              inactive_opacity = 0.95,

              shadow = {
                  enabled = true,
                  range = 4,
                  render_power = 3,
                  color = "rgba(1a1a1aee)",
              },

              blur = {
                  enabled = true,
                  size = 6,
                  passes = 3,
                  new_optimizations = false,
                  vibrancy = 0.17,
              },
          },

          animations = {
              enabled = true,
          },
      })

      ---- LAYER RULES ----
      hl.layer_rule({
          name  = "waybar-blur",
          match = { namespace = "waybar" },
          blur  = true,
          ignore_alpha = 0.4,
          xray  = true,
      })

      ---- BEZIER / SPRING CURVES ----
      hl.curve("easeOutQuint", {
          type = "bezier",
          points = { { 0.23, 1 }, { 0.32, 1 } },
      })

      hl.curve("linear", {
          type = "bezier",
          points = { { 0, 0 }, { 1, 1 } },
      })

      hl.curve("quick", {
          type = "bezier",
          points = { { 0.15, 0 }, { 0.1, 1 } },
      })

      hl.curve("easy", {
          type = "spring",
          mass = 1,
          stiffness = 71.26,
          dampening = 15.83,
      })

      hl.animation({ leaf = "windows", enabled = true, speed = 4.8, spring = "easy" })
      hl.animation({ leaf = "fade", enabled = true, speed = 3.0, bezier = "quick" })
      hl.animation({ leaf = "workspaces", enabled = true, speed = 2.0, bezier = "linear", style = "fade" })
      hl.animation({ leaf = "border", enabled = true, speed = 5.4, bezier = "easeOutQuint" })

      ---- DWINDLE / INPUT ----
      hl.config({
          dwindle = {
              preserve_split = true,
          },

          misc = {
              force_default_wallpaper = 0,
              disable_hyprland_logo = true,
          },

          input = {
              kb_layout = "us",
              kb_variant = "",
              kb_model = "",
              kb_options = "",
              kb_rules = "",
              follow_mouse = 1,
              sensitivity = 0,

              touchpad = {
                  natural_scroll = true,
              },
          },
      })

      ---- KEYBINDINGS ----
      local mainMod = "SUPER"

      hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
      hl.bind(mainMod .. " + C", hl.dsp.window.close())
      hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
      hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
      hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
      hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
      hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

      -- togglesplit was removed as a bare dispatcher in 0.54+; routed
      -- through layoutmsg now. Kept as a raw exec for compatibility.
      hl.bind(
          mainMod .. " + J",
          hl.dsp.exec_cmd("hyprctl dispatch layoutmsg togglesplit")
      )

      ---- CLIPBOARD HISTORY ----
      hl.bind(
          mainMod .. " + SHIFT + V",
          hl.dsp.exec_cmd("cliphist list | fuzzel --dmenu | cliphist decode | wl-copy")
      )

      ---- SCREENSHOTS ----
      hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))
      hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("grim - | wl-copy"))

      ---- FOCUS MOVEMENT ----
      hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
      hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
      hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
      hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

      ---- WORKSPACES ----
      for i = 1, 9 do
          hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
          hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
      end

      ---- SCROLL WORKSPACES ----
      hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
      hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

      ---- MOUSE MOVE/RESIZE ----
      hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
      hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

      ---- MEDIA / BRIGHTNESS ----
      hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"), { locked = true, repeating = true })
      hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"), { locked = true, repeating = true })
      hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"), { locked = true })
      hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })
      hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })

      ---- WINDOWS AND WORKSPACES ----
      hl.window_rule({
          name = "suppress-maximize-events",
          match = { class = ".*" },
          suppress_event = "maximize",
      })
    '';
  };
}
