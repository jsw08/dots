{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ 
    bibata-cursors
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark-BL";
      package = pkgs.gruvbox-gtk-theme; 
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
