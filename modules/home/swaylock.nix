{
  pkgs,
  ...
}:
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      color = "111111";
      ignore-empty-password = true;
      font = "'JetBrainsMono Nerd Font'";
      clock = true;
      timestr = "%R";
      fade-in = 0.1;

      indicator-idle-visible = true;

      indicator = true;
      indicator-radius = 120;
      indicator-thickness = 10;
      indicator-caps-lock = true;

      key-hl-color = "458588eb";

      separator-color = "22222260";

      inside-clear-color = "222222";
      inside-color = "1d2021";
      inside-ver-color = "ff99441c";
      inside-wrong-color = "ffffff1c";

      ring-clear-color = "ff994430";
      ring-color = "282828";
      ring-ver-color = "ffffff00";
      ring-wrong-color = "ffffff55";

      line-color = "ebdbb2eb";
      line-clear-color = "ebdbb2eb";
      line-caps-lock-color = "af3a03eb";
      line-ver-color = "ebdbb2eb";
      line-wrong-color = "9d0006eb";

      text-caps-lock-color = "00000000";
      text-clear-color = "222222";
      text-ver-color = "00000000";
      text-wrong-color = "00000000";

      bs-hl-color = "b57614eb";
      caps-lock-key-hl-color = "9d0006eb";
      caps-lock-bs-hl-color = "ebdbb2eb";

      layout-bg-color = "282828eb";
      layout-border-color = "ebdbb2ff";
      layout-text-color = "ebdbb2ff";
    };
  };
}
