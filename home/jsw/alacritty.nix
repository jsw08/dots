{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window.decorations = "none";
      font = {
	normal = {
	  family = "monospace";
	};
	size = 12;
      };
    };
  };
}
