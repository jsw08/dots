{ config, pkgs, ... }:
{
  hardware.bluetooth.enable = true;
  enironment.systemPackages = with pkgs; [
    bluetuith
  ];
}
