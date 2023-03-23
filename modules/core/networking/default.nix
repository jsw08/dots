{ config, pkgs, ... }:
{
  imports = [
    ./bluetooth.nix
    ./network.nix
  ];
}
