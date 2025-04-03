{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brave
    wl-clipboard
    cliphist
    prismlauncher
    xdg-terminal-exec
  ];
  services.flatpak.enable = true;
}
