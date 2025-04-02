{ pkgs, userConfig, ... }: {
  environment.systemPackages = with pkgs; [
    (pkgs.${userConfig.browser})
    btop
    bat
    tree
    fastfetch
    direnv

    flatpak

    # spotify
    # playerctl

    # jetbrains.idea-ultimate
    # jetbrains.rider
    # dotnet-sdk_8
    # msbuild
    # vscode-fhs
    # insomnia

    # Lsp
    lua-language-server
    nil

    # Formatters
    nixpkgs-fmt
    stylua

    # (prismlauncher.override { jdks = [ jdk8 jdk17 jdk21 ]; })
  ];

  # services.flatpak.enable = true;
}
