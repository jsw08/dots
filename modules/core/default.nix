{ config, pkgs, ... }:
{
  # Import core modules
  imports = [
    ./bootloader.nix
    ./default.nix
    ./networking/default.nix
    ./pkgs.nix
    ./security.nix
    ./time.nix
  ];
  
  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "23.05";
}
