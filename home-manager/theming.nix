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
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
    cursorTheme = {
      name = cursor_name;
      package = pkgs.bibata-cursors;
      size = cursor_size;
    };
    font = {
      size = 12;
      name = "Ubuntu Nerd Font";
    };
    gtk2.extraConfig = "gtk-application-prefer-dark-theme=1";
    gtk3.extraConfig = { gtk-application-prefer-dark-theme = "1"; };
    gtk4.extraConfig = { gtk-application-prefer-dark-theme = "1"; };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  home.packages = with pkgs; [
    materia-kde-theme
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
    qt5ct
    qt6ct
  ];


  wayland.windowManager.sway.extraConfig = "seat seat0 xcursor_theme ${cursor_name} ${toString cursor_size}";
}
