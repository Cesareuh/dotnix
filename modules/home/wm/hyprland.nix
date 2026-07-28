{ ... }:
{
	wayland.windowManager.hyprland = {
		enable = false;
		settings = {
			exec-once = [
# "ashell"
			];
			general = {
# "col.active_border" = lib.mkForce "rgb(${config.lib.stylix.colors.base0D})";
			};

			animations.enabled = "false";

			input = {
				kb_layout = "us";
				kb_variant = "altgr-intl";
				accel_profile = "flat";
				touchpad = {
					natural_scroll = false;
				};
			};

			"$mod" = "SUPER";
			"$resize" = "50";

			monitor = [
# "eDP-1, highrr, 0x0, 1"
# "HDMI-A-1, highres, auto-up, 1"
				" , preferred, auto-up, 1"
			];

			workspace = [
			]
				++
				(
				 builtins.genList (i:
					 let ws = i + 1;
					 in [
					 "${toString ws}, monitor:eDP-1"
					 ]
					 )5
				)
				++
				(
				 builtins.genList (i:
					 let ws = i + 6;
					 in [
					 "${toString ws}, monitor:HDMI-A-1"
					 ]
					 )4
				)
				;

			bind = [
				"$mod, RETURN, exec, kitty"
					"$mod, space, exec, fuzzel"

					"$mod, w, killactive"
					"$mod, code:119, exit"

					", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

					"$mod, s, togglefloating"
					"$mod, f, fullscreen"

					"$mod, h, movefocus, l"
					"$mod, j, movefocus, d"
					"$mod, k, movefocus, u"
					"$mod, l, movefocus, r"

					"$mod SHIFT, h, movewindow, l"
					"$mod SHIFT, j, movewindow, d"
					"$mod SHIFT, k, movewindow, u"
					"$mod SHIFT, l, movewindow, r"
					]
					++
					(
					 builtins.genList(i:
						 let ws = i + 1;
						 in
						 [
						 "$mod, ${toString ws}, workspace, ${toString ws}"
						 "$mod SHIFT, ${toString ws}, movetoworkspace, ${toString ws}"
						 ]
						 )9
					);
			binde = [
				", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
					", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
					", XF86MonBrightnessUp, exec, brightnessctl set 2%+"
					", XF86MonBrightnessDown, exec, brightnessctl set 2%-"

					"$mod ALT, h, resizeactive, -$resize 0"
					"$mod ALT, j, resizeactive, 0 $resize"
					"$mod ALT, k, resizeactive, 0 -$resize"
					"$mod ALT, l, resizeactive, $resize 0"
			];
			bindm = [
				"$mod, mouse:272, movewindow"
					"$mod, mouse:273, resizewindow"
			];
		};
	};
}
