{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window.decorations = "none";
      font = {
	normal = {
	  family = "";
	};
	italic = {
	  family = "";
	};
	bold = {
	  family = "";
	};
	bold_italic = {
	  family = "";
	};
	size = 13;
      };
    };
  };
}
