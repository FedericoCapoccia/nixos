{ systemConfig, ... }:
{
  programs.corectrl = {
    enable = true;
    gpuOverclock = {
      ppfeaturemask = "0xffffffff";
      enable = true;
    };
  };

  users.users.${systemConfig.username} = {
    extraGroups = [ "corectrl" ];
  };
}
