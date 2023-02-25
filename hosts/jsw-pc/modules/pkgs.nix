{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libsForQt5.polkit-kde-agent
    firefox-bin
    alacritty	
    spotify
    libreoffice

    neovim
    brightnessctl
    pulsemixer
  ];
  services.power-profiles-daemon.enable = true;
}
