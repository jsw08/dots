{ config, pkgs, ... }:
{
  services.gammastep = {
    enable = true;
    duskTime = "18:00-21:00";
    dawnTime = "7:00-8:00";
    settings = {
    };
  };
}
