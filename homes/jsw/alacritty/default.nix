{ config, pkgs, inputs, ... }:
{
  imports = [ inputs.nix-colors.homeManagerModule ];

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        decorations = "none";
        padding = {
          x = 5;
          y = 5;
        };
      };

      font = {
        normal = {
          family = "monospace";
        };
        size = 12;
      };

      # Catppuccin
      colors = {
        primary = {
          background = "#${config.colorScheme.colors.base00}"; # base
          foreground = "#${config.colorScheme.colors.base05}"; # text
          dim_foreground = "#${config.colorScheme.colors.base05}"; # text
          bright_foreground = "#${config.colorScheme.colors.base05}"; # text
        };

        cursor = {
          text = "#${config.colorScheme.colors.base00}"; # base
          cursor = "#${config.colorScheme.colors.base06}"; # rosewater
        };
        vi_mode_cursor = {
          text = "#${config.colorScheme.colors.base00}"; # base
          cursor = "#${config.colorScheme.colors.base07}"; # lavender
        };

        search = {
          matches = {
            foreground = "#${config.colorScheme.colors.base00}"; # base
            background = "#${config.colorScheme.colors.base05}"; # subtext0
          };
          focused_match = {
            foreground = "#${config.colorScheme.colors.base00}"; # base
            background = "#${config.colorScheme.colors.base0B}"; # green
          };
          footer_bar = {
            foreground = "#${config.colorScheme.colors.base00}"; # base
            background = "#${config.colorScheme.colors.base05}"; # subtext0
          };
        };

        hints = {
          start = {
            foreground = "#${config.colorScheme.colors.base00}"; # base
            background = "#${config.colorScheme.colors.base0A}"; # yellow
          };
          end = {
            foreground = "#${config.colorScheme.colors.base00}"; # base
            background = "#${config.colorScheme.colors.base05}"; # subtext0
          };
        };

        selection = {
          text = "#${config.colorScheme.colors.base00}"; # base
          background = "#${config.colorScheme.colors.base06}"; # rosewater
        };

        normal = {
          black = "#${config.colorScheme.colors.base03}"; # surface1
          red = "#${config.colorScheme.colors.base08}"; # red
          green = "#${config.colorScheme.colors.base0B}"; # green
          yellow = "#${config.colorScheme.colors.base0A}"; # yellow
          blue = "#${config.colorScheme.colors.base0D}"; # blue
          magenta = "#${config.colorScheme.colors.base0F}"; # pink
          cyan = "#${config.colorScheme.colors.base0C}"; # teal
          white = "#${config.colorScheme.colors.base05}"; # subtext1
        };

        bright = {
          black = "#${config.colorScheme.colors.base04}"; # surface2
          red = "#${config.colorScheme.colors.base08}"; # red
          green = "#${config.colorScheme.colors.base0B}"; # green
          yellow = "#${config.colorScheme.colors.base0A}"; # yellow
          blue = "#${config.colorScheme.colors.base0D}"; # blue
          magenta = "#${config.colorScheme.colors.base0F}"; # pink
          cyan = "#${config.colorScheme.colors.base0C}"; # teal
          white = "#${config.colorScheme.colors.base05}"; # subtext0
        };

        dim = {
          black = "#${config.colorScheme.colors.base03}"; # surface1
          red = "#${config.colorScheme.colors.base08}"; # red
          green = "#${config.colorScheme.colors.base0B}"; # green
          yellow = "#${config.colorScheme.colors.base0A}"; # yellow
          blue = "#${config.colorScheme.colors.base0D}"; # blue
          magenta = "#${config.colorScheme.colors.base0F}"; # pink
          cyan = "#${config.colorScheme.colors.base0C}"; # teal
          white = "#${config.colorScheme.colors.base05}"; # subtext1
        };

        indexed_colors = [
          { index = 16; color = "#${config.colorScheme.colors.base09}"; }
          { index = 17; color = "#${config.colorScheme.colors.base06}"; }
        ];
      };
    };
  };
}
