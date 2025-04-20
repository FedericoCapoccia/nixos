{ pkgs, ... }:
{
  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kitty
    kdePackages.sddm-kcm
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    oxygen
  ];

}
