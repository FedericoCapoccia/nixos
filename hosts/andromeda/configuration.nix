{ pkgs, userConfig, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../base.nix
    ../../modules/sway.nix
    ../../modules/corectrl.nix
    ../../modules/pipewire.nix
    ../../modules/packages.nix
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Ubuntu" "UbuntuMono" "JetBrainsMono" ]; })
  ];

  services.getty.autologinUser = userConfig.username;
}
