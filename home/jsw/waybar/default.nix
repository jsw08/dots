{ config, pkgs, home-manager, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      waybar =
        let
          hyprctl = "${pkgs.hyprland}/bin/hyprctl";
          waybarPatchFile = import ./patch.nix { inherit pkgs hyprctl; };
        in
        prev.waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
          patches = (oldAttrs.patches or [ ]) ++ [ waybarPatchFile ];
          # postPatch = (oldAttrs.postPatch or "") + ''
          #   sed -i 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp
          # '';
        });
    })
  ];
  home-manager.users.jsw = {
    programs.waybar = {
      enable = true;
      settings = [{
        # Config
        layer = "top";
        spacing = 4;
        margin = "5px 7px 0px 7px";
        fixed-center = true;

        modules-left = [ "wlr/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "temperature"
          "cpu"
          "backlight"
          "network"
          "pulseaudio"
          "battery"
          "tray"
        ];

        # Modules
        "wlr/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        tray = {
          # "icon-size": 21,
          spacing = 10;
        };
        clock = {
          # "timezone": "America/New_York",
          tooltip-format = "<big>{: %Y %B}</big>\n <tt><small>{calendar}</small></tt>";
          format-alt = "{: %Y-%m-%d}";
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };
        memory = {
          format = "{}% ";
        };
        temperature = {
          # "thermal-zone": 2,
          # "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input",
          critical-threshold = 80;
          # "format-critical": "{temperatureC}°C {icon}",
          format = "{temperatureC}°C {icon}";
          format-icons = [ "" "" "" "" ];
        };
        backlight = {
          # "device": "acpi_video1",
          format = "{percent}% ";
          on-scroll-up = "brightnessctl set +10%";
          on-scroll-down = "brightnessctl set 10%-";
        };
        battery = {
          states = {
            # "good": 95,
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% "; 
         format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          # "format-good": "", // An empty format will hide the module
          "format-full" = "";
          format-icons = [ "" "" "" "" "" ];
        };
        network = {
          # "interface" = "wlp2*", // (Optional) To force the use of this interface
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        pulseaudio = {
          # "scroll-step": 1, // %, can be a float
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          on-click = "alacritty pulsemixer";
        };
      }];
      style = ''
        * {
          border: none;
          border-radius: 0;
          font-family: monospace;
          font-weight: bold;
          font-size: 14px;
          min-height: 0;
        }

        window#waybar {
          background: rgba(21, 18, 27, 0);
          color: #cdd6f4;
        }

        tooltip {
          background: #1e1e2e;
          border-radius: 10px;
          border-width: 2px;
          border-style: solid;
          border-color: #11111b;
        }

        #workspaces button {
          padding: 5px;
          color: #a89984;
          margin-right: 5px;
        }

        #workspaces button.active {
          color: #ebdbb2;
        }

        #workspaces button.focused {
          color: #a6adc8;
          border-radius: 10px;
        }

        #workspaces button.urgent {
          color: #fb4934;
          border-radius: 10px;
        }

        #workspaces button:hover {
          background: #504945;
          border-radius: 10px;
        }

        #window,
        #clock,
        #battery,
        #pulseaudio,
        #network,
        #workspaces,
        #tray,
        #temperature,
        #cpu,
        #backlight {
          background: #3c3836;
          padding: 0px 10px;
          margin: 3px 0px;
        }

        #tray {
          border-radius: 10px;
          margin-right: 10px;
        }

        #workspaces {
          border-radius: 10px;
          margin-left: 10px;
          padding-right: 0px;
          padding-left: 5px;
        }

        #temperature {
          color: #fe8019;
          border-radius: 10px 0px 0px 10px;
          border-right: 0px;
          margin-left: 10px;
        }

        #cpu {
          color: #8ec07c;
          border-left: 0px;
          border-right: 0px;
        }


        #window {
          border-radius: 10px;
          margin-left: 60px;
          margin-right: 60px;
        }

        #clock {
          color: #ebdbb2;
          border-radius: 10px;
          margin-left: 10px;
        }

        #network {
          color: #d3869b;
          border-left: 0px;
          border-right: 0px;
        }

        #pulseaudio {
          color: #83a598;
          border-left: 0px;
          border-right: 0px;
        }

        #battery {
          color: #b8bb26;
          border-radius: 0 10px 10px 0;
          margin-right: 7px;
          padding-right: 3px;
          border-left: 0px;
        }

        #backlight {
          color: #fabd2f;
          border-left: 0px;
          border-right: 0px;
        }
      '';
    };
  };
}




