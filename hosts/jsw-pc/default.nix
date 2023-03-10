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

    # Creating docker file so that i can move it to my server later
#    ../../modules/docker/default.nix
  ];

  # Autologin
  services.xserver.displayManager = {
    defaultSession = "hyprland";
    autoLogin = {
      enable = true;
      user = "jsw";
    };
  };

  networking.hostName = "jsw-pc";
}

