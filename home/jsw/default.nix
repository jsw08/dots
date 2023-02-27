{ config, pkgs, hyprland, home-manager, ... }:
{
  imports = [ 
    home-manager.nixosModules.home-manager 
    ./waybar/default.nix 
  ]; 

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
      glxinfo
      rustdesk

      # Obs
      obs-studio
      qt6.qtwayland
    ];
    services.udiskie.enable = true;

    imports = [ 
      ./hyprland/default.nix 
      ./wofi/default.nix 
      ./git.nix 
      ./fish.nix 
      ./alacritty.nix 
      ./vscode.nix 
    ]; 
  };
}
