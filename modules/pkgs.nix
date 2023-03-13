{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    neovim
    git
    killall
    bat
  ];
  services.udisks2.enable = true; 
}

