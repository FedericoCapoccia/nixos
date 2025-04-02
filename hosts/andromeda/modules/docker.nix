{ systemConfig, pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    extraPackages = [ pkgs.docker-compose ];
  };

  users.users.${systemConfig.username}.extraGroups = [ "docker" ];
}
