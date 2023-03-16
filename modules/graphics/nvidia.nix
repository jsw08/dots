{ config, pkgs, ... }:
{
  services.xserver.videoDrivers = ["nvidia"];
  environment.variables = {
    #GBM_BACKEND = "nvidia-drm"; # firefox errors 
    __GLX_VENDOR_LIBRARY_NAME = "nvidia"; 
    LIBVA_DRIVER_NAME = "nvidia";
  };

  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
  ];

  hardware = {
    nvidia = {
      modesetting.enable = true;
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        libva
        nvidia-vaapi-driver
      ];
    };
  };
}
