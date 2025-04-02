{ userConfig, pkgs, ... }: {
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    extraPackages = [ pkgs.docker-compose ];
  };

  users.users.${userConfig.username}.extraGroups = [ "docker" ];
}
