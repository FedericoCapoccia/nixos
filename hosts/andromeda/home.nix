{ config, pkgs, userConfig, ... }:
{
  home.username = userConfig.username;
  home.homeDirectory = "/home/" + userConfig.username;
  programs.home-manager.enable = true;

  imports = [
    ../../home-manager/sway.nix
    ../../home-manager/zsh.nix
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      download = "${config.home.homeDirectory}/Downloads";
      documents = "${config.home.homeDirectory}/Documents";
      music = "${config.home.homeDirectory}/Media/Music";
      pictures = "${config.home.homeDirectory}/Media/Pictures";
      videos = "${config.home.homeDirectory}/Media/Video";
      desktop = "${config.home.homeDirectory}/.desktop";
      publicShare = "${config.home.homeDirectory}/.public";
      templates = "${config.home.homeDirectory}/.templates";
    };
    mimeApps = {
      enable = true;
    };
  };
  home.stateVersion = "24.05";
}
