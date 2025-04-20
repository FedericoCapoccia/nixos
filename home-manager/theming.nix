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

  # qt = {
  # enable = true;
  # platformTheme.name = "qt6ct";
  # style.name = "kvantum";
  # };

  home.packages = with pkgs; [
    materia-kde-theme
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qtstyleplugin-kvantum
    qt6ct
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    XCURSOR_SIZE = cursor_size;
    XCURSOR_THEME = cursor_name;
  };

}
