{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #discord
    webcord-vencord
  ];
  xdg.configFile."Vencord/themes/gruvbox.theme.css".source = ./gruvbox.css;
}