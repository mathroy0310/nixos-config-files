{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    # Misc
    openssl
    onefetch

    # Nix
    nixd # lsp
    nixfmt-rfc-style # nixformater

    # C / C++
    clang-tools
    gcc
    gdb
    gnumake

    # zig
    inputs.zig.packages."${system}".master
    zls
  ];
}
