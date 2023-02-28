{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    videoDrivers = [ "modesetting" ];
    displayManager = {
      lightdm.enable = true;	
    };
  };
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
    enable = true;
  };

  fonts.fonts = with pkgs; [
    font-awesome
    font-awesome_5
    caladea
    carlito
    dejavu_fonts
    liberation_ttf
    noto-fonts
    noto-fonts-emoji
    overpass
    roboto
    gyre-fonts
    ubuntu_font_family
    courier-prime
    gelasio
    merriweather
    source-code-pro
    nerdfonts
    jetbrains-mono
  ];

  environment.systemPackages = with pkgs; [
    gnome3.adwaita-icon-theme
  ];
}
