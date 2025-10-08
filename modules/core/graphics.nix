{ pkgs, ... }:
{
  boot.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
  ];
  services.xserver.videoDrivers = [ "nvidia" ];
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;  # For 32-bit games
    extraPackages = with pkgs; [
      mesa
      libGL
      vaapiVdpau
      libvdpau-va-gl
      glxinfo
      vulkan-tools
    ];
  };
  
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;
    nvidiaSettings = true;
  };

}
