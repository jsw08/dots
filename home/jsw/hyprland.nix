{ config, pkgs, hyprland, ... }:
{
  imports = [ hyprland.homeManagerModules.default ];

  services.dunst.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    nvidiaPatches = true;
    extraConfig = ''
      		    # Monitor
      		    #monitor=,preferred,auto,1
      		    monitor = eDP-1,preferred,0x0,1
      		    monitor = HDMI-A-2,preferred,1920x0,1

      		    # Autostart
      		    # exec-once=/usr/lib/polkit-kde-authentication-agent-1
      		    exec=fish -c "pkill waybar; waybar"
		    exec-once=albert

      		    # Keyboard and mouse
      		    input {
      			kb_layout = us

      			follow_mouse = 1
      			touchpad {
      			    natural_scroll = no
      			    tap-to-click = yes
      			}

      			sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      		    }

      		    gestures {
      			workspace_swipe = on
      		    }

      		    # General, looks and animations
      		    general {
      			gaps_in = 5
      			gaps_out = 10
      			border_size = 2
      			col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
      			col.inactive_border = rgba(595959aa)

      			layout = dwindle
      		    }

      		    decoration {
      			rounding = 10
      			blur = yes
      			blur_size = 3
      			blur_passes = 1
      			blur_new_optimizations = on
      			active_opacity = 0.9
      			inactive_opacity = 0.8

      			drop_shadow = yes
      			shadow_range = 4
      			shadow_render_power = 3
      			col.shadow = rgba(1a1a1aee)
      		    }
      		    animations {
      			enabled = yes
      			bezier = myBezier, 0.05, 0.9, 0.1, 1.05
      			animation = windows, 1, 7, myBezier
      			animation = windowsOut, 1, 7, default, popin 80%
      			animation = border, 1, 10, default
      			animation = borderangle, 1, 8, default
      			animation = fade, 1, 7, default
      			animation = workspaces, 1, 6, default
      		    }

      		    # Layouts
      		    dwindle {
      			pseudotile = yes 
      			preserve_split = yes # you probably want this
      		    }

      		    # Keybinds
      		    $mainMod = ALT
      		    bind = $mainMod, RETURN, exec, kitty
      		    bind = $mainMod_SHIFT, RETURN, exec, firefox

      		    bind = $mainMod, Q, killactive, 
      		    bind = $mainMod_SHIFT, E, exit, 
      		    bind = $mainMod, SPACE, togglefloating, 
      		    bind = $mainMod, P, togglesplit, # dwindle
      		    bind = $mainMod, F, fullscreen
		    bind = $mainMod, D, exec, wofi -i --show drun

      		    bind = $mainMod, H, movefocus, l
      		    bind = $mainMod, L, movefocus, r
      		    bind = $mainMod, K, movefocus, u
      		    bind = $mainMod, J, movefocus, d

      		    bind = $mainMod, 1, workspace, 1
      		    bind = $mainMod, 2, workspace, 2
      		    bind = $mainMod, 3, workspace, 3
      		    bind = $mainMod, 4, workspace, 4
      		    bind = $mainMod, 5, workspace, 5
      		    bind = $mainMod, 6, workspace, 6
      		    bind = $mainMod, 7, workspace, 7
      		    bind = $mainMod, 8, workspace, 8
      		    bind = $mainMod, 9, workspace, 9
      		    bind = $mainMod, 0, workspace, 10

      		    bind = $mainMod SHIFT, 1, movetoworkspace, 1
      		    bind = $mainMod SHIFT, 2, movetoworkspace, 2
      		    bind = $mainMod SHIFT, 3, movetoworkspace, 3
      		    bind = $mainMod SHIFT, 4, movetoworkspace, 4
      		    bind = $mainMod SHIFT, 5, movetoworkspace, 5
      		    bind = $mainMod SHIFT, 6, movetoworkspace, 6
      		    bind = $mainMod SHIFT, 7, movetoworkspace, 7
      		    bind = $mainMod SHIFT, 8, movetoworkspace, 8
      		    bind = $mainMod SHIFT, 9, movetoworkspace, 9
      		    bind = $mainMod SHIFT, 0, movetoworkspace, 10

      		    bind = $mainMod, mouse_down, workspace, e+1
      		    bind = $mainMod, mouse_up, workspace, e-1
      		    bindm = $mainMod, mouse:272, movewindow
      		    bindm = $mainMod, mouse:273, resizewindow
      		'';
  };
}