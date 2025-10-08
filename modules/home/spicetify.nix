{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      theme = spicePkgs.themes.text;
      colorScheme = "Gruvbox";
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        queueTime
        hidePodcasts
        shuffle
        fullAppDisplay
      ];
    };
}
