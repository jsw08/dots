{ config, pkgs, ... }:
{
  let
    my-python-packages = p: with p; [
      pygame
    ];
  in
  environment.systemPackages = [
    python3
    (pkgs.python3.withPackages my-python-packages)
  ];
}
