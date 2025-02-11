{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
      if not pgrep -u (whoami) ssh-agent > /dev/null
        eval (ssh-agent -c)
        if not ssh-add -l | grep -q "~/.ssh/id_e25519_sign"
          ssh-add ~/.ssh/id_e25519_sign
        end
      end
    '';
    shellAliases = {
      c = "clear";
      cat = "bat";
      code = "codium";
    };
  };
}
