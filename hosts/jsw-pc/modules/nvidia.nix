{ config, pkgs, ... }:
let
  pr = pkgs.writeShellScriptBin "pr" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    export LIBVA_DRIVER_NAME=nvidia
    export XDG_SESSION_TYPE=wayland
    export __GLX_VENDOR_LIBARY_NAME=nvidia
    export WLR_NO_HARDWARE_CURSORS=1

    #GBM_BACKEND="nvidia-drm";
    exec "$@"
  '';
in {
  boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.extraModprobeConfig = ''
    options nvidia-drm modeset=1
  '';
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    #GBM_BACKEND="nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  #hardware.nvidia = {
  #  prime = {
  #    offload.enable = true;
  #    intelBusId = "PCI:00:02:0";
  #    nvidiaBusId = "PCI:01:00:0";
  #  };
  #  modesetting.enable = true;
  #  powerManagement = {
  #    enable = true;
  #    finegrained = true;
  #  };
  #};
  services.xserver.videoDrivers = [ "nvidia" ];

  environment.systemPackages = with pkgs; [
    pr 	
    libsForQt5.qt5.qtwayland
    libva
    nvidia-vaapi-driver
  ];
}
