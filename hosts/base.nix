{ pkgs, systemConfig, userConfig, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
  };

  networking = {
    hostName = systemConfig.hostname;
    networkmanager.enable = true;
    firewall.enable = true;
  };

  time.timeZone = systemConfig.timezone;
  i18n.defaultLocale = systemConfig.locale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemConfig.locale_extra;
    LC_IDENTIFICATION = systemConfig.locale_extra;
    LC_MEASUREMENT = systemConfig.locale_extra;
    LC_MONETARY = systemConfig.locale_extra;
    LC_NAME = systemConfig.locale_extra;
    LC_NUMERIC = systemConfig.locale_extra;
    LC_PAPER = systemConfig.locale_extra;
    LC_TELEPHONE = systemConfig.locale_extra;
    LC_TIME = systemConfig.locale_extra;
  };

  users.defaultUserShell = pkgs.zsh;
  users.users.${userConfig.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  programs.zsh.enable = true;
  programs.dconf.enable = true;
  programs.nix-ld.enable = true;

  environment.pathsToLink = [ "/share/zsh" ];
  environment.systemPackages = with pkgs; [
    neovim
    git
    stow
    zsh
    home-manager
    # glib
    # clang
  ];

  environment.sessionVariables = { EDITOR = "nvim"; };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  system.stateVersion = "24.11";
}

