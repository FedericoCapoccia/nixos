{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop
    bat
    tree
    fastfetch
    direnv

    # Lsp
    lua-language-server
    nil

    # Formatters
    nixfmt-tree
    stylua
  ];
}
