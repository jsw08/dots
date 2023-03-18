{ config, pkgs, ... }: 
let screenshot = pkgs.writeShellScriptBin "screenshot" ''
  #!/usr/bin/env bash

  tmp=$(mktemp)
  WORKSPACES="$(hyprctl monitors -j | jq -r 'map(.activeWorkspace.id)')"
  WINDOWS="$(hyprctl clients -j | jq -r --argjson workspaces "$WORKSPACES" 'map(select([.workspace.id] | inside($workspaces)))')"

  grim -o $(hyprctl monitors -j | jq -r ".[] | select(.focused == true) | .name") $tmp
  imv -w "PAUSESHOT" -f $tmp &

  pid=$!
  GEOM=$(echo "$WINDOWS" | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | slurp)
  grim -g "$GEOM" - > $tmp

  kill $pid
  mv $tmp "$tmp.png"

  bash -c "$@ $tmp.png"
  cat "$tmp.png" | wl-copy
  rm "$tmp.png"

  echo "$tmp.png"
''; 
in {
  environment.systemPackages = with pkgs; [
    bash
    imv
    grim
    jq
    slurp
    screenshot
  ];
}
