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
    jdk
    eyedropper
  ];
  services.flatpak.enable = true;
}
