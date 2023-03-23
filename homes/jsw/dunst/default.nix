{ config, pkgs, inputs, ... }:
{
  imports = [ inputs.nix-colors.homeManagerModule ];
  ##${config.colorScheme.colors.base00}
  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_color = "#${config.colorScheme.colors.base0D}";
        separator_color = "frame";
      };
      urgency_low = {
        background = "#${config.colorScheme.colors.base00}";
        foreground = "#${config.colorScheme.colors.base05}";
      };
      urgency_normal = {
        background = "#${config.colorScheme.colors.base00}";
        foreground = "#${config.colorScheme.colors.base05}";
      };
      urgency_critical = {
        background = "#${config.colorScheme.colors.base00}";
        foreground = "#${config.colorScheme.colors.base05}";
        frame_color = "#${config.colorScheme.colors.base09}";
      };
    };
  };
}
