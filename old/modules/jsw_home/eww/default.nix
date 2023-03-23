{ config, pkgs, inputs, ... }:
{
  programs.eww = {
    enable = true;
    configDir = ./config;
  };
}
