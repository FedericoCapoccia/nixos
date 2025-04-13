{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brave
    wl-clipboard
    cliphist
    prismlauncher
    jetbrains-toolbox
    vscode-fhs
    qtspim
  ];
  services.flatpak.enable = true;
}
