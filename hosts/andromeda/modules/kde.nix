{ pkgs, ... }:
{
  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kitty
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    oxygen
  ];

}
