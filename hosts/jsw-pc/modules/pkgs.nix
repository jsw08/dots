{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox-bin
    alacritty	
    spotify
    libreoffice

    brightnessctl
  ];
  services.power-profiles-daemon.enable = true;
}
