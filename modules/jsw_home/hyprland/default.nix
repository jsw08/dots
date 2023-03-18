{ config, pkgs, inputs, ... }:
{
  imports = [ inputs.hyprland.homeManagerModules.default ];

  home.file.".config/hypr/background.jpg".source = ./background.jpg;
  wayland.windowManager.hyprland = {
    enable = true;
    nvidiaPatches = true;
    extraConfig = ''
            # Colors
            $rosewater = 0xfff2d5cf
            $flamingo  = 0xffeebebe
            $pink      = 0xfff4b8e4
            $mauve     = 0xffca9ee6
            $red       = 0xffe78284
            $maroon    = 0xffea999c
            $peach     = 0xffef9f76
            $yellow    = 0xffe5c890
            $green     = 0xffa6d189
            $teal      = 0xff81c8be
            $sky       = 0xff99d1db
            $sapphire  = 0xff85c1dc
            $blue      = 0xff8caaee
            $lavender  = 0xffbabbf1

            $text      = 0xffc6d0f5
            $subtext1  = 0xffb5bfe2
            $subtext0  = 0xffa5adce

            $overlay2  = 0xff949cbb
            $overlay1  = 0xff838ba7
            $overlay0  = 0xff737994

            $surface2  = 0xff626880
            $surface1  = 0xff51576d
            $surface0  = 0xff414559

            $base      = 0xff303446
            $mantle    = 0xff292c3c
            $crust     = 0xff232634

			# Monitor
            env test, test
			monitor = eDP-1,preferred,0x0,1
			workspace = eDP-1,5

			monitor = HDMI-A-2,1920x1080@120,1920x0,1

			# Autostart
			exec-once=/etc/polkit-kde-agent/agent
			exec-once = waybar
			exec-once = swaybg -m fit -i /home/jsw/.config/hypr/background.jpg 
			exec-once = hyprctl setcursor "Bibata-Modern-Ice" 24

			# Keyboard and mouse
			input {
				kb_layout = us
                kb_options = compose:menu, compose:ralt
				follow_mouse = 1
                # now default
                #touchpad {
                #	natural_scroll = no
                #	tap-to-click = yes
                #}
				sensitivity = 0
			}

			gestures {
				workspace_swipe = on
			}

			# General, looks and animations
			general {
				gaps_out = 10
				border_size = 2
				col.active_border = $blue
				col.inactive_border = $base

				layout = dwindle
			}

			decoration {
				rounding = 10
				blur = yes
				blur_size = 3
				blur_passes = 1
				blur_new_optimizations = on
				active_opacity = 0.95
				inactive_opacity = 0.85

				drop_shadow = yes
				shadow_range = 4
				shadow_render_power = 3
				col.shadow = rgba(1a1a1aee)
			}
			animations {
                enabled = yes

                bezier = myBezier, 0.05, 0.9, 0.1, 1.05
                bezier = myBezier2, 0.65, 0, 0.35, 1

                bezier=slow,0,0.85,0.3,1
                bezier=overshot,0.7,0.6,0.1,1.1
                bezier=bounce,1,1.6,0.1,0.85
                bezier=slingshot,1,-1,0.15,1.25
                bezier=nice,0,6.9,0.5,-4.20
                
                animation=windows,1,5,bounce,popin
                animation=border,1,20,default
                animation=fade,1,5,default
                animation=workspaces,1,5,overshot,slide
			}

			# Layouts
			dwindle {
				pseudotile = yes 
				preserve_split = yes # you probably want this
			}

			# Keybinds
			$mainMod = ALT
			bind = $mainMod, RETURN, exec, alacritty
			bind = $mainMod_SHIFT, RETURN, exec, firefox

			bind = $mainMod, Q, killactive 
			bind = $mainMod, SPACE, togglefloating 
			bind = $mainMod, P, togglesplit # dwindle
			bind = $mainMod, F, fullscreen
			bind = $mainMod_SHIFT, E, exit 

			bindr = $mainMod, D, exec, pkill wofi || wofi -a 
			bind = $mainMod_SHIFT, D, exec, discord
			bind = $mainMod, S, exec, spotify
			bind = $mainMod, A, exec, alacritty -e pulsemixer
			bind = $mainMod, N, exec, alacritty -e nmtui
			bind = $mainMod, B, exec, alacritty -e bluetuith

			binde=, XF86AudioRaiseVolume, exec, pulsemixer --change-volume +5
			binde=, XF86AudioLowerVolume, exec, pulsemixer --change-volume -5
			binde=, XF86AudioMute, exec, pulsemixer --toggle-mute
			binde=, XF86AudioPause, exec, playerctl play-pause 
			binde=, XF86AudioNext, exec, playerctl next
			binde=, XF86AudioPrev, exec, playerctl previous
			binde=, XF86MonBrightnessUp, exec, brightnessctl set 10%+
			binde=, XF86MonBrightnessDown, exec, brightnessctl set 10%-

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
