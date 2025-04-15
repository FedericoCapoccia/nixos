{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop
    bat
    tree
    fastfetch
    direnv
    ripgrep
    emoji-picker

    # Lsp
    lua-language-server
    nil

    # Formatters
    nixfmt-tree
    stylua
  ];
}
