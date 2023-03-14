{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    git
    unzip
    neovim

    firefox-bin
    alacritty
    libreoffice
    brightnessctl
    python3
    pfetch
  ];  
}
