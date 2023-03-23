{ config, pkgs, ... }:
{
  home.file.".config/deckmaster".source = ./deck;
  home.packages = with pkgs; [
    deckmaster
  ];
}
