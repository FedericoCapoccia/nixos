{ pkgs, systemConfig, ... }:
{
  imports = [
    ../base.nix
    ../shared_packages.nix
  ];
  wsl.defaultUser = "fede";
}
