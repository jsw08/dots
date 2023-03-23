{ config, pkgs, ... }:
{
  imports = [
    ./default.nix
    ./hyprland.nix
    ./nvidia.nix
    ./pipewire.nix
    ./variables.nix
  ];
}
