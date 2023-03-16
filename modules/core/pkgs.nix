{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    git
    unzip
    neovim
    killall
    python3

    firefox-bin
    alacritty
    libreoffice
    brightnessctl
    pfetch
  ];  
}
