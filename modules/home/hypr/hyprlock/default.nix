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
          path = "${../../../../assets/wallpaper.png}";
          blur_passes = 2;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      input-field = [
        {
          monitor = "DP-3";
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
        {
          monitor = "DP-3";
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
      ];
    };
  };
}
