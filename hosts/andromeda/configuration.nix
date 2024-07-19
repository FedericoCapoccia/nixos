{ pkgs, userConfig, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../base.nix
    ../../modules/sway.nix
    ../../modules/corectrl.nix
    ../../modules/pipewire.nix
    ../../modules/packages.nix
    ../../modules/gaming.nix
    ../../modules/bluetooth.nix
    ../../modules/docker.nix
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Ubuntu" "UbuntuMono" "JetBrainsMono" ]; })
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.getty.autologinUser = userConfig.username;
}
