{ config, pkgs, ... }:
{
  # Import core modules
  imports = [
    ./bluetooth.nix
    ./bootloader.nix
    ./games.nix
    ./network.nix
    ./pipewire.nix
    ./pkgs.nix
    ./security.nix
    ./services.nix
    ./users.nix
    ./time.nix
    ./streamdeck.nix
  ];
  
  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "23.05";
}
