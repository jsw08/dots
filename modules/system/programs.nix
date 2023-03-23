{ config, lib, pkgs, ... }:
with lib; 
{
  options.modules.programs = {
    cli = {
      enabled = mkEnableOption "Enable CLI programs";
    };
    gui = {
      enabled = mkEnableOption "Enable GUI programs";
    };

    gaming = {
      enable = mkEnableOption "Enable packages required for the device to be gaming-ready";

      gamescope = mkOption {
        type = types.bool;
        default = false;
        description = "Gamescope";
      };
    };

    # default program options
    default = {
      terminal = mkOption {
        type = types.enum ["foot" "kitty" "alacritty"];
        default = "foot";
      };

      fileManager = mkOption {
        type = types.enum ["thunar" "nnn" "lf" ];
        default = "lf";
      };

      browser = mkOption {
        type = types.enum ["firefox" "librewolf" "chromium"];
        default = "firefox";
      };

      editor = mkOption {
        type = types.enum ["neovim" "helix" ];
        default = "neovim";
      };
    };

#    override = {
#      program = {
#
#        /*
#           FIXME: proof of concept
#        "*" = {
#          disable = mkOption {
#            type = types.bool;
#            description = "Forcefully disables any program that has been overriden to be disabled.";
#          };
#          enable = mkOption {
#            type = types.bool;
#            description = "Forcefully enables any program that has been overriden to be enabled.";
#          };
#        };
#        */
#      };
#      service = {
#        /*
#        TODO: Override option for services
#        */
#      };
#    };
  };
}
