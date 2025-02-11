{ pkgs, ... }:
{
  programs.foot = with pkgs; {
    enable = true;
    #theme = "gruvbox-dark";
    settings = {
      main = {
        term = "xterm-256color";

        font = "JetBrainsMono Nerd Font:size 11";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
