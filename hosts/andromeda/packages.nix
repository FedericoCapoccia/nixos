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
    vulkan-tools-lunarg
  ];
  services.flatpak.enable = true;
}
