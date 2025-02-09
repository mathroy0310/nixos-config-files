{ pkgs, host, ... }:
{
	environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
