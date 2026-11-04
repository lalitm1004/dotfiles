{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 0;

        modules-left = [
          "clock"
          "hyprland/workspaces"
        ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "network"
          "pulseaudio"
          "battery"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "󰫢";
            occupied = "󰫣";
            default = "󰫣";
            empty = "󰫣";
          };
          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
          };
          persistent-only = true;
          all-outputs = false;
          sort-by = "number";
          on-click = "activate";
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 60;
          separate-outputs = true;
        };

        network = {
          interval = 3;
          format-wifi = "󰖩";
          format-ethernet = "󰈀";
          format-disconnected = "󰖪";
          tooltip-format = "{ifname}: {ipaddr}";
          on-click = "networkmanager_dmenu";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟";
          format-icons = {
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          scroll-step = 5;
          on-click = "pamixer -t";
          on-click-right = "pavucontrol";
        };

        battery = {
          interval = 5;
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-full = "󰁹 {capacity}%";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          states = {
            warning = 30;
            critical = 15;
          };
        };

        clock = {
          interval = 1;
          format = "{:%H:%M}";
          format-alt = "{:%a %d %b}";
          tooltip-format = "{:%A, %d %B %Y}";
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", monospace;
        font-size: 13px;
        font-weight: 500;
      }

      window#waybar {
        background: transparent;
        color: #ffffff;
        min-height: 32px;
      }

      #clock, #workspaces, #window, #network, #pulseaudio, #battery {
        background: rgba(35, 31, 32, 0.82);
        color: #ffffff;
        border: none;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.18);
        min-height: 24px;
        margin-top: 4px;
        margin-bottom: 4px;
        padding-top: 0;
        padding-bottom: 0;
        border-radius: 999px;
      }

      #clock {
        margin-left: 8px;
        margin-right: 4px;
        padding-left: 13px;
        padding-right: 13px;
      }

      #workspaces {
        margin-left: 0;
        margin-right: 4px;
        padding-left: 4px;
        padding-right: 4px;
      }

      #workspaces button {
        background: transparent;
        color: rgba(255, 255, 255, 0.40);
        border: none;
        border-radius: 999px;
        padding-left: 8px;
        padding-right: 8px;
        margin: 0;
        min-height: 24px;
      }

      #workspaces button.occupied { color: rgba(255, 255, 255, 0.75); }
      #workspaces button.empty { color: rgba(255, 255, 255, 0.25); }
      #workspaces button.active {
        color: #ffffff;
        background: rgba(255, 255, 255, 0.14);
      }
      #workspaces button:hover {
        color: #ffffff;
        background: rgba(255, 255, 255, 0.08);
      }

      #window {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 999px;
      }

      #window.empty {
        background: transparent;
        box-shadow: none;
        padding-left: 0;
        padding-right: 0;
        margin-top: 4px;
        margin-bottom: 4px;
      }

      #network {
        margin-left: 4px;
        margin-right: 4px;
        min-width: 32px;
        padding-left: 8px;
        padding-right: 8px;
      }
      #network.disconnected { color: rgba(255, 255, 255, 0.45); }

      #pulseaudio {
        margin-left: 0;
        margin-right: 4px;
        padding-left: 12px;
        padding-right: 12px;
      }
      #pulseaudio.muted { color: rgba(255, 255, 255, 0.45); }

      #battery {
        margin-left: 0;
        margin-right: 8px;
        padding-left: 12px;
        padding-right: 12px;
      }
      #battery.warning, #battery.critical, #battery.charging { color: #ffffff; }

      tooltip {
        background: rgba(35, 31, 32, 0.94);
        color: #ffffff;
        border: 1px solid rgba(255, 255, 255, 0.08);
        border-radius: 999px;
      }
      tooltip label { color: #ffffff; }
    '';
  };
}
