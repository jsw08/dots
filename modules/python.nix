{ config, pkgs, ... }:
let
  my-python-packages = p: with p; [
  pygame
]; in {
  environment.systemPackages = with pkgs; [
    python3
    (pkgs.python3.withPackages my-python-packages)
  ];
}
