{ config, pkgs, inputs, ... }: 
let screenshot = pkgs.writeShellScriptBin "screenshot" ''
  #!/usr/bin/env sh

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
          if curl --request POST \
          --url https://api.upload.systems/images/upload \
          --header 'Content-Type: multipart/form-data' \
          --form key=$(cat $HOME/Documents/uploadKey) \
          --form file="@$tmpImage" | \
          jq -r '.url' | wl-copy -n
          then
            dunstify -i "$tmpImage" -a "screenshot" "Screenshot Copied" "Your url has been copied to the clipboard"
          else
            dunstify -i "$tmpImage" -a "screenshot" "Screenshot failed" "Screenshot failed to upload. Please try again later."
          fi
          mv $tmpImage $HOME/Pictures/Screenshots/"Screenshot from $(date '+%d.%m.%y %H:%M:%S').png"
          exit $?
  fi

  echo "Screenshot cancelled."
  exit 1
''; 
in {
  environment.systemPackages = with pkgs; [
    screenshot
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    jq
  ];
}
