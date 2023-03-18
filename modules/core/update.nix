{ config, pkgs, ... }: 
let update = pkgs.writeShellScriptBin "update" ''
  #!/usr/bin/env bash
  cd ~/.dots/

  nix flake update
  sudo nixos-rebuild boot

  git add
  git commit "flake update"
  git push

''; 
in {
  environment.systemPackages = with pkgs; [
    update
  ];
}
