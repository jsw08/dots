{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    rmview
  ];
  home.file.".config/rmview.json".source = ./rmview.json;
}
