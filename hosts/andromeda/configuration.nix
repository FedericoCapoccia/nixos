{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../base.nix
  ];

  services.getty.autologinUser = "fede";
}
