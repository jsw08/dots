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
  boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.extraModprobeConfig = ''
    options nvidia-drm modeset=1
  '';

  services.xserver.videoDrivers = [ "nvidia" ];
  environment.systemPackages = with pkgs; [
    pr 	
    libva
    nvidia-vaapi-driver
  ];
}
