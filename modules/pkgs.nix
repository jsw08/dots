{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    neovim
    git
    pfetch
  ];
  services.udisks2.enable = true; 
}

