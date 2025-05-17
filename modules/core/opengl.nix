{ pkgs, ... }:
{
  hardware.opengl = {
    enable = true;
    # driSupport = true;
    driSupport32Bit = true;  # For 32-bit games
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}