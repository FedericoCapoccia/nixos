{ config, pkgs, ... }:
let ohmyposhConfig = "${config.xdg.configHome}/oh-my-posh";
in {
  home = {
    packages = [ pkgs.oh-my-posh ];
    file."${ohmyposhConfig}/zen.toml".text =
      builtins.readFile ./config/oh-my-posh/zen.toml;
  };
  programs.zsh.initExtra = ''
    eval "$(${pkgs.oh-my-posh}/bin/oh-my-posh init zsh --config ${ohmyposhConfig}/zen.toml)"
  '';
}
