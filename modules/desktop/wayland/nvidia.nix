{ config, pkgs, ... }:
{
  environment.variables = {
    #GBM_BACKEND = "nvidia-drm"; # firefox errors
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
  };

  hardware = {
    nvidia = {
      modesetting.enable = true;
    };
    opengl = {
      extraPackages = with pkgs; [
        libva
        nvidia-vaapi-driver
      ];
    };
  };
}
