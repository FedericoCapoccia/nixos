{ pkgs, systemConfig, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = with pkgs; [
    mangohud
    protonup-qt
    protontricks
    # lutris
    # heroic
    # bottles
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/${systemConfig.username}/.steam/root/compatibilitytools.d";
  };
}
