{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    # Misc
    openssl
    onefetch

    # Nix
    nixd # lsp
    nixfmt-rfc-style # nixformater

    # dbg
    lldb

    # C / C++
    glibc
    
    clang-tools
    gcc_multi
    gdb
    gnumake

    # zig
    inputs.zig.packages."${system}".default
    # zig
    zls
  ];
}
