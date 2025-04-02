{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brave
    flatpak
    wl-clipboard
    cliphist
  ];
}
