{ config, pkgs, inputs, ... }: 
let screenshot = pkgs.writeShellScriptBin "screenshot" ''
  #!/bin/sh

  tmpImage=$(mktemp /tmp/tmpImage.XXXXXXXXXX --suffix .png) # Makes a temporary file to save the screenshot to

  case $1 in
    --monitor)
      grimblast save output "$tmpImage"
      ;;
    --selection)
      grimblast save area "$tmpImage"
      ;;
    --active)
      grimblast save active "$tmpImage"
      ;;
    *)
      echo 'wrong or missing argument'
      ;;
  esac

  tmpImageSize=$(wc -c <"$tmpImage")

  if [ $tmpImageSize != 0 ]; then
          cp $tmpImage $HOME/Pictures/Screenshots/"Screenshot from $(date '+%d.%m.%y %H:%M:%S').png"
          curl --request POST \
          --url https://api.upload.systems/images/upload \
          --header 'Content-Type: multipart/form-data' \
          --form key=$(cat $HOME/Documents/uploadKey) \
          --form file="@$tmpImage" | \
          jq -r '.url' | wl-copy -n
          dunstify -i "$tmpImage" -a "screenshot" "Screenshot Copied" "Your screenshot has been copied to the clipboard"
          exit $?
  fi

  echo "Screenshot cancelled."
  exit 1
''; 
in {
  environment.systemPackages = with pkgs; [
    screenshot
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];
}
