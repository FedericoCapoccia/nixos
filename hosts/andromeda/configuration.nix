{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../base.nix
    ../../modules/sway.nix
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Ubuntu" "UbuntuMono" "JetBrainsMono" ]; })
  ];

  services.getty.autologinUser = "fede";
}
