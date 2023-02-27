{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      import = [
      ];
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
