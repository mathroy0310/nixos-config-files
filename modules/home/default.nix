{
  host,
  ...
}:
{
  imports =
    if (host == "desktop") then
      [
        ./discord
        ./fastfetch
        ./hypr
        ./rofi
        ./swappy
        ./swaync
        ./waybar
        ./bat.nix
        ./browser.nix
        ./eza.nix
        ./fish.nix
        ./foot.nix
        ./git.nix
        ./gtk.nix
        ./lazygit.nix
        ./nemo.nix
        ./obsidian.nix
        ./packages.nix
        ./ranger.nix
        ./spicetify.nix
        ./steam.nix
        ./starship.nix
        ./swaylock.nix
        ./vscodium.nix
        ./zathura.nix
      ]
    else
      [
        ./discord
        ./fastfetch
        ./hypr
        ./rofi
        ./swappy
        ./swaync
        ./waybar
        ./bat.nix
        ./browser.nix
        ./eza.nix
        ./fish.nix
        ./foot.nix
        ./git.nix
        ./gtk.nix
        ./lazygit.nix
        ./nemo.nix
        ./packages.nix
        ./ranger.nix
        ./spicetify.nix
        ./starship.nix
        ./swaylock.nix
        ./vscodium.nix
      ];
}
