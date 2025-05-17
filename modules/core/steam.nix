{ pkgs, ... }:
{
  hardware.steam-hardware.enable = true;

  programs = {
    steam = {
      enable = true;

      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;

      gamescopeSession.enable = true;

      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };

    gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };

    gamemode = {
      enable = true;
      settings = {
        general = {
          renice = 10;
        };

        custom = {
          start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
          end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
        };
      };
    };

    coolercontrol = {
      enable = true;
      nvidiaSupport = true;
    };
  };

  services.sunshine = {
    enable = false;
  };

  environment.systemPackages = with pkgs; [
    protonup-qt
  ];

}
