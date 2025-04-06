{ pkgs, systemConfig, ... }:
{
  imports = [
    ../base.nix
    ../shared_packages.nix
  ];
  wsl.defaultUser = "fede";

  systemd.services.symlink_wayland_socket = {
    enable = true;
    description = "Symlink Wayland socket to XDG_RUNTIME_DIR";
    wantedBy = [ "default.target" ];
    serviceConfig = {
      Type = "oneshot";
      User = systemConfig.username;
      ExecStart = ''
        ${pkgs.coreutils}/bin/ln -sf /mnt/wslg/runtime-dir/wayland-0 /run/user/1000/.
      '';
    };
  };
}
