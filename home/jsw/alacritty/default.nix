{ config, pkgs, ... }:
{
  home.file.".config/alacritty/catppuccin/catppuccin-macchiato.yml".source = ./catppuccin-macchiato.yml;
  programs.alacritty = {
    enable = true;
    settings = {
      import = [
        /home/jsw/.config/alacritty/catppuccin/catppuccin-mocha.yml
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
