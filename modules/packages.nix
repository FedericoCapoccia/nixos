{ pkgs, userConfig, ... }:
{
  environment.systemPackages = with pkgs; [
    (pkgs.${userConfig.terminal})
    (pkgs.${userConfig.browser})
    bat
    fastfetch
    direnv
    stremio

    spotify
    playerctl

    jetbrains.idea-ultimate
    jetbrains.rider
    dotnet-sdk_8
    msbuild
    vscode-fhs

    # Lsp
    sumneko-lua-language-server
    nil

    # Formatters
    nixpkgs-fmt
    stylua

    (prismlauncher.override { jdks = [ jdk8 jdk17 jdk21 ]; })
  ];

  services.flatpak.enable = true;
}
