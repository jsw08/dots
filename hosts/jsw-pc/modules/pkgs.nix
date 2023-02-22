{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libsForQt5.polkit-kde-agent
    firefox-bin
    kitty
    spotify
    libreoffice

    neovim
    brightnessctl
    pulsemixer
    bluetuith
    wl-clipboard
  ];
  services.power-profiles-daemon.enable = true;
}
