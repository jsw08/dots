{ config, pkgs, ... }: 
let update = pkgs.writeShellScriptBin "n-update" ''
  #!/usr/bin/env bash
  export TEMP = $(mktemp -d)

  cd "$TEMP"
  git clone https://github.com/jsw08/dots "$TEMP"

  nix flake update
  git add
  git commit "flake update"
  git push
  
  rm -rf "$TEMP"

  sudo nixos-rebuild boot --flake "git+https://github.com/jsw08/dots"
''; 
in {
  environment.systemPackages = with pkgs; [
    update
  ];
}
