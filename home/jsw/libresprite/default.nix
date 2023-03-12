{ config, pkgs, ... }:
{
  home.packages = [ libresprite ];
  home.file.".config/libresprite/data/skins/dark".source = ./Neutral-Dark-Theme-main;	
}
