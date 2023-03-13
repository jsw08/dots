{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox-bin
    alacritty	
    spotify
    libreoffice

    brightnessctl
    python3
    pfetch
  ];
  services.power-profiles-daemon.enable = true;
}
