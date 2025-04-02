{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop
    bat
    tree
    fastfetch
    direnv
    ripgrep

    # Lsp
    lua-language-server
    nil

    # Formatters
    nixfmt-tree
    stylua
  ];
}
