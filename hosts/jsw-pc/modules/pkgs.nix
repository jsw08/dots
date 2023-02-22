{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libsForQt5.polkit-kde-agent
    firefox-bin
    alacritty	
    spotify
    libreoffice
    lxappearance-gtk3

    neovim
    brightnessctl
    pulsemixer
    bluetuith
    wl-clipboard
  ];
  services.power-profiles-daemon.enable = true;
}
