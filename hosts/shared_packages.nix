{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop
    bat
    tree
    fastfetch
    direnv
    ripgrep
    fd
    tldr
    emoji-picker
    jq
    libcamera

    # Lsp
    lua-language-server
    nil

    # Formatters
    nixfmt-tree
    stylua
  ];
}
