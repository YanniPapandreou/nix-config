{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (rust-bin.selectLatestNightlyWith (toolchain: toolchain.default))
    rust-analyzer
    gcc
    evcxr
  ];

}
