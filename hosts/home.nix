{ config, systemConfig, ... }:
{
  home.username = systemConfig.username;
  home.homeDirectory = "/home/" + systemConfig.username;
  programs.home-manager.enable = true;

  imports = [
    ../home-manager/zsh.nix
    ../home-manager/theming.nix
    ../home-manager/git.nix
    ../home-manager/oh-my-posh.nix
    ../home-manager/direnv.nix
    ../home-manager/kitty.nix
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
  home.stateVersion = "24.11";
}
