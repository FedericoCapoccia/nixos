{ pkgs, config, ... }:
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

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    gtk2.extraConfig = "gtk-application-prefer-dark-theme=1";
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = "1";
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = "1";
    };
  };

  home.packages = with pkgs; [
    materia-kde-theme
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    XCURSOR_SIZE = cursor_size;
    XCURSOR_THEME = cursor_name;
  };

}
