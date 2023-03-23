{ config, pkgs, ... }:
{
  home.packages = [ pkgs.libresprite ];
  home.file.".config/libresprite/data/skins/".source = ./skins;	
}
