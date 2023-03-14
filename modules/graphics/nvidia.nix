{ config, pkgs, ... }:
let
  pr = pkgs.writeShellScriptBin "pr" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    export LIBVA_DRIVER_NAME=nvidia
    export WLR_NO_HARDWARE_CURSORS=1

    #GBM_BACKEND="nvidia-drm";
    exec "$@"
  '';
in {
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.extraModprobeConfig = ''
    options nvidia-drm modeset=1
  '';

  environment.variables = {
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia"; # possible firefox crashes with
    WLR_NO_HARDWARE_CURSORS = "1";
  };
  
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      pr
      libva
      nvidia-vaapi-driver
    ];
  };
}
