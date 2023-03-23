{ config, pkgs, ...}:
{
  home.file.".config/wofi/".source = ./wofi;	
  home.packages = [ pkgs.wofi ];
}
