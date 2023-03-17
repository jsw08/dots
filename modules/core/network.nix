
{ config, pkgs, ... }:
{ 
  networking.networkmanager = {
    enable = true;
    insertNameservers = [ "1.1.1.1" "1.0.0.1" ];
  };
  systemd.services.NetworkManager-wait-online.enable = false;
}
