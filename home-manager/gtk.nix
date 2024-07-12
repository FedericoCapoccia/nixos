{ pkgs, ... }:
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
    cursorTheme = {
      name = "Phinger";
      package = pkgs.phinger-cursors;
      size = 16;
    };
    font = {
      size = 11;
      name = "Ubuntu Nerd Font";
    };
    gtk2.extraConfig = "gtk-application-prefer-dark-theme=1";
    gtk3.extraConfig = { gtk-application-prefer-dark-theme = "1"; };
    gtk4.extraConfig = { gtk-application-prefer-dark-theme = "1"; };
  };
}
