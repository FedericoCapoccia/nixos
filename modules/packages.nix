{ pkgs, userConfig, ... }:
{
  environment.systemPackages = with pkgs; [
    (pkgs.${userConfig.terminal})
    (pkgs.${userConfig.browser})
    bat
  ];
}
