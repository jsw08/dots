{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    neovim
    git
    pfetch
    killall
    python
  ];
  services.udisks2.enable = true; 
}

