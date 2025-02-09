{
  pkgs,
  lib,
  inputs,
  ...
}:
let 
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in 
{
  nixpkgs.config.allowUnfreePredicate = 
    pkg: builtins.elem (lib.getName pkg) [ "spotify" ];

    imports = [ inputs.spicetify-nix.homeManagerModules.default ];

    programs.spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle
      ];
      theme = spicePkgs.themes.dribbblish;
      colorScheme = "gruvbox-material-dark";
    };
}