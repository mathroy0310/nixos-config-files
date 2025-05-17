{ username, ... }:
{

  boot.initrd.luks.devices = {}; # Only if using LUKS; safe to leave empty
  boot.initrd.supportedFilesystems = [ "ext4" ]; # Add more if needed
  # boot.initrd.lvm.enable = true;

  fileSystems."/home/${username}/data" = {
    device = "/dev/vg_merged/lv_data";
    fsType = "ext4";
    options = [ "defaults" ];
  };
}