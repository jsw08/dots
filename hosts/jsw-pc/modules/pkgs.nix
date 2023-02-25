{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libsForQt5.polkit-kde-agent
    firefox-bin
    alacritty	
    spotify
    libreoffice

    adw-gtk3
    lxappearance

    neovim
    brightnessctl
    pulsemixer
    wl-clipboard
  ];
  services.power-profiles-daemon.enable = true;
}
