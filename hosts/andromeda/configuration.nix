{ pkgs, systemConfig, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../base.nix
    ../shared_packages.nix

    ./packages.nix
    ./modules/gnome.nix
    ./modules/corectrl.nix
    ./modules/pipewire.nix
    ./modules/gaming.nix
    ./modules/bluetooth.nix
  ];

  networking = {
    hostName = "andromeda";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.gvfs.enable = true;

  # services.getty.autologinUser = userConfig.username;
}
