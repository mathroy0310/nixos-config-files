{
  config,
  inputs,
  pkgs,
  ...
}:

{

  xdg.configFile."hypr/hyprlock".source = ./avatar.png;

  programs.hyprlock = {
    enable = true;

    package = inputs.hyprlock.packages.${pkgs.system}.hyprlock;

    settings = {
      general = {
          grace = 0;
          disable_loading_bar = true;
          ignore_empty_input = true;
          text_trim = true;
      };

      background = [
        {
          path = "${../../../../wallpapers/starry-sky.png}";
          blur_passes = 2;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "230, 50";
          outline_thickness = "4";
          dots_size = "0.2"; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = "0.2"; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = "true";
          outer_color = "rgba(102, 92, 84, 0.33)";
          fail_color = "rgba(22222299)";
          inner_color = "rgba(102, 92, 84, 0.33)";
          font_color = "rgb(34, 34, 34)";
          fade_on_empty = "false";
          font_family = "JetBrainsMono Nerd Font";
          placeholder_text = ''<i><span foreground="##fbf1c7">Input Password...</span></i>'';
          hide_input = false;
          position = "0, -100";
          halign = "center";
          valign = "center";
          zindex = "10";
        }
      ];

    
      label = [
          # clock
        {
          monitor = "";
          text = "$TIME";
          color = "rgba(235, 219, 178, 0.9)";
          font_size = 50;
          shadow_passes = "3";
          shadow_boost = "0.5";
          font_family = "JetBrainsMono Nerd Font";
          position = "0, -200";
          halign = "center";
          valign = "top";
          zindex = "3";
        }
        # User
        {
          monitor = "";
          text = "  $USER";
          shadow_passes = "1";
          shadow_boost = "0.5";
          color = "rgba(235, 219, 178, 1)";
          font_size = 14;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, -38";
          halign = "center";
          valign = "bottom";
          zindex = "2";
      }
      ];

      # avatar
      image = {
          monitor = "";
          path = "./avatar.png";
          size = "100";
          rounding = "-1";
          border_size = "3";
          border_color = "rgba(235, 219, 178, 0.9)";
          position = "0, 45";
          halign = "center";
          valign = "center";
          zindex = "3";
      };
    };
  };
}
