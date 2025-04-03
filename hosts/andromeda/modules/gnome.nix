{ pkgs, ... }:
{
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    ptyxis
    gnome-software
    gnome-tweaks
    dconf-editor
    gnomeExtensions.appindicator
  ];

  environment.gnome.excludePackages = (
    with pkgs;
    [
      atomix
      cheese
      epiphany
      evince
      geary
      gedit
      gnome-characters
      gnome-console
      gnome-music
      gnome-photos
      gnome-tour
      gnome-terminal
      hitori
      iagno
      tali
      totem
    ]
  );

  services.udev.packages = with pkgs; [ gnome-settings-daemon ];
}
