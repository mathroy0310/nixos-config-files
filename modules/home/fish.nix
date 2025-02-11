{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
      if not pgrep -u (whoami) ssh-agent > /dev/null
        eval (ssh-agent -c)
        ssh-add ~/.ssh/id_e25519_sign
      end
    '';
    shellAliases = {
      c = "clear";
      cat = "bat";
      code = "codium";
    };
  };
}
