{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    extraConfig = "tab_bar_style powerline";
  };
}
