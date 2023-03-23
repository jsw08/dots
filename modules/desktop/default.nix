{ config, pkgs, ... }:
{
  imports = [
    ./fonts.nix
    ./games/default.nix
    ./pkgs.nix
    ./wayland/default.nix
  ];
}
