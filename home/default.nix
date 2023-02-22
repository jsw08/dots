{ config, pkgs, home-manager, hyprland, ... }:
{
  imports = [ home-manager.nixosModules.home-manager ]; 

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {
    inherit hyprland;
  };
  users.groups.dotfiles = {
    members = [ "root" "jsw" ];
  };
}
