{ config, pkgs, ... }:
{
  fonts.fonts = with pkgs; [
    caladea
    carlito
    dejavu_fonts
    liberation_ttf
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    noto-fonts-emoji
    overpass
    roboto
    gyre-fonts
    ubuntu_font_family
    courier-prime
    gelasio
    merriweather
    source-code-pro
    jetbrains-mono
  ];
}
