{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox-bin
    alacritty
    libreoffice
    spotify

    brightnessctl
    pfetch
  ];
}
