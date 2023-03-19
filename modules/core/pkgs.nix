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
    lf

    firefox-bin
    alacritty
    libreoffice
    spotify
    brightnessctl
    pfetch
  ];  
}
