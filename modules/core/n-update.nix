{ config, pkgs, ... }: 
let update = pkgs.writeShellScriptBin "n-update" ''
  #!/usr/bin/env bash
  export TEMP=$(mktemp -d)
  echo "# Folder: $TEMP"

  cd "$TEMP"
  echo "# Cloning repo..."
  nix flake clone "git+https://github.com/jsw08/dots.git" --dest $TEMP

  echo "# Updating flake..."
  nix flake update
  git add .
  git commit "flake update"
  echo "Pushing back to github..."
  git push

  echo "Updating system..."
  sudo nixos-rebuild boot --flake "$TEMP"

  echo "Deleting folder..."
  rm -rf "$TEMP"
  cd /

''; 
in {
  environment.systemPackages = with pkgs; [
    update
  ];
}
