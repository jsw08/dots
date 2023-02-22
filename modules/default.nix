{ config, pkgs, ...}:
{
  imports = [
    ./network.nix
    ./security.nix
    ./time.nix
    ./pkgs.nix
    ./boot.nix
  ];

  system.stateVersion = "23.05";
}
