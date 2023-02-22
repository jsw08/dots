{ config, pkgs, hyprland, home-manager, ... }:
{
  imports = [ home-manager.nixosModules.home-manager ./waybar/default.nix ]; 

  users.users.jsw = {
    isNormalUser = true;
    home = "/home/jsw/";
    description = "Jurn Wubben";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };

  home-manager.users.jsw = {
    home.username = "jsw";
    home.homeDirectory = "/home/jsw/";
    home.stateVersion = "23.05";
    programs.home-manager.enable = true;

    home.packages = with pkgs; [ 
      # Steam
      steam
    ];
    services.udiskie.enable = true;

    imports = [ ./hyprland.nix ./wofi/default.nix ]; 
  };
}
