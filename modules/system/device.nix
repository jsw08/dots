{ config, lib, pkgs, ... }:
with lib; 
{
  options.modules.device = {
    type = mkOption {
      type = types.enum [ "desktop" "laptop" "lite"];
      default = "desktop";
    };

    gpu = mkOption {
      type = types.enum ["intel" "nvidia" "hybrid-nv"];
      default = "";
    };

    networking = {
      bluetooth.enable = mkOption {
        type = types.bool;
        default = true;
        description = "Whether or not the system has bluetooth support";
      };

      internet.enable = mkOption {
        type = types.bool;
        default = true;
        description = "Whether or not the system has bluetooth support";
      };

    };
 
    hasSound = mkOption {
      type = types.bool;
      default = true;
    };

    hasTPM = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
