{ config, pkgs, ... }:
let
  plugins = p: with p; [
    streamdeck
    pillow
  ];
in {
  home.file.".local/bin/streamdeck" = {
    source = ./main.py;
    executable = true;
  };
  home.file.".local/bin/streamdeckAssets".source = ./assets;
  home.packages = with pkgs; [
    ( python3.withPackages plugins )
  ];
}
