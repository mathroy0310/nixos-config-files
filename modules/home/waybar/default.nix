{ host, ... }:
{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 28;
        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
        ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "custom/weather"
          "pulseaudio"
          "battery"
          "clock"
        ];
        "hyprland/workspaces" = {
          disable-scroll = true;
          show-special = true;
          special-visible-only = true;
          all-outputs = false;
          format = "{icon}";
          format-icons = {
            "default" = "";
            "active" = "";
          };

          persistent-workspaces =
            if (host == "desktop") then
              {
                "DP-3" = [
                  1
                  2
                  3
                  4
                  5
                ];
                "DP-4" = [
                  6
                  7
                  8
                  9
                  10
                ];
              }
            else
              {
                "*" = 8;
              };
        };

        "custom/weather" = {
          format = " {} ";
          exec = "curl -s 'wttr.in/Quebec?format=%c%t'";
          interval = 300;
          class = "weather";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} {volume}% ";
          format-muted = "";
          format-icons = {
            "headphones" = "";
            "handsfree" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 1;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "custom/launcher" = {
          format = "{icon}";
          format-icons = {
            "default" = "";
          };
          on-click = "rofi -show drun || pkill rofi";
        };

        "clock" = {
          format = " {:%H:%M}";
          format-alt = " {:%m-%d-%Y}";
        };
      };
    };
  };
}
