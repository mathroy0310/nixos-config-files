{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    vesktop
  ];
  # imports = [
  #   inputs.nixcord.homeModules.nixcord

  #   ./plugins.nix
  #   ./quickCss.nix
  # ];

  # programs.nixcord = {
  #   enable = true;
  #   discord.enable = false;
  #   vesktop = {
  #     enable = true;
  #     package = pkgs.vesktop;
  #   };

  #   config = {
  #     useQuickCss = true;
  #     frameless = true;
  #   };
  # };
}
