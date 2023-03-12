{ config, pkgs, ... }:
{
  home.packages = [ pkgs.libresprite ];
  home.file.".config/libresprite/data/skins/dark".source = ./Neutral-Dark-Theme-main;	
}
