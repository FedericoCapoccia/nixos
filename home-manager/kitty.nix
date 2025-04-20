{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "CaskaydiaMono Nerd Font";
      package = pkgs.nerd-fonts.caskaydia-mono;
      size = 12;
    };
  };
}
