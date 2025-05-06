{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
      set fish_greeting

      eval (ssh-agent -c) > /dev/null
      ssh-add ~/.ssh/id_e25519_sign > /dev/null
    '';
    shellAliases = {
      c = "clear";
      cat = "bat";
      code = "codium";
    };
  };
}
