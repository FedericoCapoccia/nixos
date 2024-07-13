{ pkgs, userConfig, ... }:
{
  environment.systemPackages = with pkgs; [
    (pkgs.${userConfig.terminal})
    (pkgs.${userConfig.browser})
    bat
    fastfetch
    direnv

    jetbrains.idea-ultimate
    jetbrains.rider
    dotnet-sdk_8
    msbuild

    # Lsp
    sumneko-lua-language-server
    nil

    # Formatters
    nixpkgs-fmt
    stylua
  ];
}
