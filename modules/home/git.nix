{
  programs.git = {
    enable = true;
    userName = "mathroy0310";
    userEmail = "mathroy0310@gmail.com";
    extraConfig = {
      init.defaultBrach = "master";
      pull.rebase = true;
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingKey = "~/.ssh/id_e25519.pub";
    };
    ignores = [
      "*.swp"
      "*.direnv"
    ];
  };

  programs.fish.shellAliases = {
    g = "lazygit";
    gf = "onefetch --number-of-file-churns 0 --no-color-palette";
  };
}
