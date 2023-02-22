{ config, pkgs, home-manager, hyprland, ...}:
{
  imports = [
    # Host specific files
    ./modules/nvidia.nix
    ./modules/pkgs.nix
    ./modules/hardware-configuration.nix

    # General user config
    ../../home/default.nix

    # Users
    ../../home/jsw/default.nix

    # General modules
    ../../modules/default.nix
    ../../modules/display.nix
    ../../modules/hyprland.nix
    ../../modules/pipewire.nix
  ];

  # Autologin
  services.xserver.displayManager = {
    defaultSession = "Hyprland";
    autoLogin = {
      enable = true;
      user = "jsw";
    };
  };

  networking.hostName = "jsw-pc";
}

