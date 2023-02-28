{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ 
    bibata-cursors
  ];

  gtk = {
    enable = true;
    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk; 
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
}