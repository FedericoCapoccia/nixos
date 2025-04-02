{ userConfig, ... }: {
  programs.corectrl = {
    enable = true;
    gpuOverclock = {
      ppfeaturemask = "0xffffffff";
      enable = true;
    };
  };

  users.users.${userConfig.username} = { extraGroups = [ "corectrl" ]; };
}
