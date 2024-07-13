{ pkgs, userConfig, ... }:
{
  environment.systemPackages = with pkgs; [
    (pkgs.${userConfig.terminal})
    (pkgs.${userConfig.browser})
    bat
    fastfetch
    direnv

    # Lsp
    sumneko-lua-language-server
    nil

    # Formatters
    nixpkgs-fmt
    stylua
  ];
}
