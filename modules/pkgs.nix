{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    neovim
    git
    pfetch
    killall
    python3
  ];
  services.udisks2.enable = true; 
}

