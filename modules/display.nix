{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    videoDrivers = [ "modesetting" ];
  };
  services.greetd = {
    enable = true;
    settings = {
      terminal.vt = 1;	
      default_session = {
	command = "cage -- GTK_THEME=Adwaita:dark gtkgreet -c Hyprland";
      };
    };
  };
  environment.systemPackages = [
    pkgs.greetd.gtkgreet
    pkgs.cage
  ];

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
}
