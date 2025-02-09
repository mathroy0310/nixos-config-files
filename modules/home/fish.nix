{ pkgs, ... }:
{
	programs.fish = {
		enable = true;
        interactiveShellInit = ''
            starship init fish | source
        '';
        shellAliases = {
            c = "clear";
            cat = "bat";
            code = "codium";
        };
	};
}
