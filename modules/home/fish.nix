{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
      set fish_greeting

      eval (ssh-agent -c) > /dev/null
      ssh-add ~/.ssh/id_ed25519 > /dev/null
    '';
    shellAliases = {
      c = "clear";
      cat = "bat";
      code = "codium";
      nix-shell = "nix-shell --command fish";
    };
  };
}
