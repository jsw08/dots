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
    ../../modules/bluetooth.nix
    ../../modules/games.nix
    ../../modules/python.nix
  ];

  # Autologin
  services.xserver.displayManager = {
    defaultSession = "hyprland";
    autoLogin = {
      enable = true;
      user = "jsw";
    };
  };

  services.xserver.windowManager.i3.enable = true;
  networking.hostName = "jsw-pc";
}

