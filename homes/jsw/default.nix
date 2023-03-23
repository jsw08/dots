{ config, pkgs, inputs, ... }:
{
  imports = [ 
    inputs.home-manager.nixosModules.home-manager 
    #./waybar/default.nix 
  ]; 

  users.users.jsw = {
    isNormalUser = true;
    initialPassword = "changeme";
    home = "/home/jsw/";
    description = "Jurn Wubben";
    extraGroups = [ "wheel" "networkmanager" "dotfiles" ];
    shell = pkgs.fish;
  };

  home-manager.users.jsw = {
    home.username = "jsw";
    home.homeDirectory = "/home/jsw/";
    home.stateVersion = "23.05";
    programs.home-manager.enable = true;

    services.udiskie.enable = true;
    imports = [ 
      ./packages.nix

      ./colors/default.nix
      ./streamdeck/default.nix
      ./eww/default.nix
      ./firefox/default.nix
      ./alacritty/default.nix
      ./dunst/default.nix
      ./fish/default.nix
      ./git/default.nix
      ./hyprland/default.nix
      ./libresprite/default.nix
      ./neovim/default.nix
      ./packages.nix
      ./ssh/default.nix
      ./theme/default.nix
#      ./vscode/default.nix
      ./wofi/default.nix
      ./gammastep/default.nix
      ./rmview/default.nix
    ];
  };
}
