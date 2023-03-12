{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window.decorations = "none";
      font = {
      normal = {
        family = "monospace";
      };
        size = 12;
      };

      # tokyonight storm
      colors = { 
        primary = {
            background = "0x24283b";
            foreground = "0xc0caf5";
          };

        normal = {
            black =   "0x1d202f";
            red =     "0xf7768e";
            green =   "0x9ece6a";
            yellow =  "0xe0af68";
            blue =    "0x7aa2f7";
            magenta = "0xbb9af7";
            cyan =    "0x7dcfff";
            white =   "0xa9b1d6";
          };

        bright = {
            black =   "0x414868";
            red =     "0xf7768e";
            green =   "0x9ece6a";
            yellow =  "0xe0af68";
            blue =    "0x7aa2f7";
            magenta = "0xbb9af7";
            cyan =    "0x7dcfff";
            white =   "0xc0caf5" ;
          };
      };

      indexed_colors = [
        { index = 16; color = "0xff9e64"; }
        { index = 17; color = "0xdb4b4b"; }
      ];

    };
  };
}
