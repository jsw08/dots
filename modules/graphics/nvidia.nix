{ config, pkgs, ... }:
{
  services.xserver.videoDrivers = ["nvidia"];
  environment.variables = {
#    GBM_BACKEND = "nvidia-drm"; gtk errors
#    __GLX_VENDOR_LIBRARY_NAME = "nvidia"; firefox errors
    LIBVA_DRIVER_NAME = "nvidia";
  };

  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
  ];

  hardware = {
    nvidia = {
      open = true;
      powerManagement.enable = true;
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
