{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ 
    bibata-cursors
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "latte";
      };
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  home.sessionVariables = {
    XCURSOR_THEME="Bibata-Modern-Ice";
    XCURSOR_SIZE="24";
  };

  # Also change the cursor option in hyprland.nix in the autolaunch section
}
