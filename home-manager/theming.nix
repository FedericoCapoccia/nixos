{ pkgs, ... }:
let
  cursor_name = "Bibata-Modern-Classic";
  cursor_size = 20;
in
{
  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = cursor_name;
      package = pkgs.bibata-cursors;
      size = cursor_size;
    };

    gtk2.extraConfig = "gtk-application-prefer-dark-theme=1";
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = "1";
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = "1";
    };
  };
}
