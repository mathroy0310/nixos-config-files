{ pkgs, ... }:
{
  networking.firewall.allowedTCPPorts = [ 25565 ];

  services.minecraft-server = {
    enable = true;
    eula = true;
    openFirewall = true;
    declarative = true;
    package = pkgs.minecraftServers.vanilla-1-21;
    serverProperties = {
      server-port = 25565;
      difficulty = 3;
      gamemode = 1;
      max-players = 5;
      motd = "Mathieu server";
      allow-cheats = true;
    };
    jvmOpts = "-Xms4092M -Xmx8184M";
  };
}
