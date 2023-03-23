{ config, pkgs, ... }:
{
  services.xserver = {
    videoDrivers = [ "modesetting" ];
  };
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
    enable = true;
  };
}
