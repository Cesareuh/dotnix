{ pkgs, inputs, config, ... }:
{
	imports = [
		# inputs.niri.homeModules.niri
	];

	home.file.".config/niri".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/modules/home/wm/niri;

	# programs.niri = {
	# 	enable = false;
	# 	package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
	# 	settings = {
	# 		hotkey-overlay.skip-at-startup = true;
	# 		input = {
	# 			focus-follows-mouse = {
	# 				enable = true;
	# 			};
	# 			keyboard = {
	# 				xkb = {
	# 					layout = "us";
	# 					variant = "altgr-intl";
	# 				};
	# 				numlock = true;
	# 			};
	#
	# 			touchpad = {
	# 				tap = true;
	# 				natural-scroll = true;
	# 				accel-profile = "flat";
	# 			};
	#
	# 			mouse = {
	# 				accel-profile = "flat";
	# 			};
	# 		};
	#
	# 		window-rules = [{
	# 			# open-maximized = true;
	# 		}];
	#
	# 		prefer-no-csd = true;
	# 		screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
	#
	# 		binds = {
	# 			"Mod+Shift+Slash".action.show-hotkey-overlay = {};
	# 			"Mod+Return".action.spawn = "ghostty";
	# 			"Mod+Space".action.spawn = "fuzzel";
	# 			"XF86AudioRaiseVolume" = {
	# 				allow-when-locked=true;
	# 				action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+" "-l" "1.0"];
	# 			};
	# 			"XF86AudioLowerVolume" = {
	# 				allow-when-locked=true;
	# 				action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"];
	# 			};
	# 			"XF86AudioMute" = {
	# 				allow-when-locked=true;
	# 				action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
	# 			};
	# 			"XF86AudioMicMute" = {
	# 				allow-when-locked=true;
	# 				action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"];
	# 			};
	#
	# 			"XF86MonBrightnessUp" = {
	# 				allow-when-locked=true;
	# 				action.spawn = ["brightnessctl" "--class=backlight" "set" "+10%"];
	# 			};
	# 			"XF86MonBrightnessDown" = {
	# 				allow-when-locked=true;
	# 				action.spawn = ["brightnessctl" "--class=backlight" "set" "10%-"];
	# 			};
	#
	#
	# 			"Mod+O" = { repeat=false; action.toggle-overview = {}; };
	# 			"Mod+W" = { repeat=false; action.close-window = {}; };
	#
	# 			"Mod+Left".action.focus-column-or-monitor-left = {};
	# 			"Mod+Down".action.focus-window-or-monitor-down = {};
	# 			"Mod+Up".action.focus-window-or-monitor-up = {};
	# 			"Mod+Right".action.focus-column-or-monitor-right = {};
	# 			"Mod+H".action.focus-column-or-monitor-left = {};
	# 			"Mod+J".action.focus-window-or-monitor-down = {};
	# 			"Mod+K".action.focus-window-or-monitor-up = {};
	# 			"Mod+L".action.focus-column-or-monitor-right = {};
	#
	# 			"Mod+Shift+Left".action.move-column-left = {};
	# 			"Mod+Shift+Down".action.move-window-down = {};
	# 			"Mod+Shift+Up".action.move-window-up = {};
	# 			"Mod+Shift+Right".action.move-column-right = {};
	# 			"Mod+Shift+H".action.move-column-left = {};
	# 			"Mod+Shift+J".action.move-window-down = {};
	# 			"Mod+Shift+K".action.move-window-up = {};
	# 			"Mod+Shift+L".action.move-column-right = {};
	#
	# 			# Alternative commands that move across workspaces when reaching
	# 			# the first or last window in a column.
	# 			# Mod+J     { focus-window-or-workspace-down; }
	# 			# Mod+K     { focus-window-or-workspace-up; }
	# 			# Mod+Ctrl+J     { move-window-down-or-to-workspace-down; }
	# 			# Mod+Ctrl+K     { move-window-up-or-to-workspace-up; }
	#
	# 			"Mod+Ctrl+Left".action.focus-monitor-left = {};
	# 			"Mod+Ctrl+Down".action.focus-monitor-down = {};
	# 			"Mod+Ctrl+Up".action.focus-monitor-up = {};
	# 			"Mod+Ctrl+Right".action.focus-monitor-right = {};
	# 			"Mod+Ctrl+H".action.focus-monitor-left = {};
	# 			"Mod+Ctrl+J".action.focus-monitor-down = {};
	# 			"Mod+Ctrl+K".action.focus-monitor-up = {};
	# 			"Mod+Ctrl+L".action.focus-monitor-right = {};
	#
	# 			"Mod+Ctrl+Shift+Left".action.move-column-to-monitor-left = {};
	# 			"Mod+Ctrl+Shift+Down".action.move-column-to-monitor-down = {};
	# 			"Mod+Ctrl+Shift+Up".action.move-column-to-monitor-up = {};
	# 			"Mod+Ctrl+Shift+Right".action.move-column-to-monitor-right = {};
	# 			"Mod+Ctrl+Shift+H".action.move-column-to-monitor-left = {};
	# 			"Mod+Ctrl+Shift+J".action.move-column-to-monitor-down = {};
	# 			"Mod+Ctrl+Shift+K".action.move-column-to-monitor-up = {};
	# 			"Mod+Ctrl+Shift+L".action.move-column-to-monitor-right = {};
	#
	# 			# Alternatively, there are commands to move just a single window:
	# 			# Mod+Shift+Ctrl+Left  { move-window-to-monitor-left; }
	# 			# ...
	# 			#
	# 			# And you can also move a whole workspace to another monitor:
	# 			# Mod+Shift+Ctrl+Left  { move-workspace-to-monitor-left; }
	# 			# ...
	#
	# 			"Mod+U".action.focus-workspace-down = {};
	# 			"Mod+I".action.focus-workspace-up = {};
	# 			"Mod+Ctrl+U".action.move-column-to-workspace-down = {};
	# 			"Mod+Ctrl+I".action.move-column-to-workspace-up = {};
	# 			"Mod+Shift+U".action.move-workspace-down = {};
	# 			"Mod+Shift+I".action.move-workspace-up = {};
	#
	# 			"Mod+1".action.focus-workspace = 1;
	# 			"Mod+2".action.focus-workspace = 2;
	# 			"Mod+3".action.focus-workspace = 3;
	# 			"Mod+4".action.focus-workspace = 4;
	# 			"Mod+5".action.focus-workspace = 5;
	# 			"Mod+6".action.focus-workspace = 6;
	# 			"Mod+7".action.focus-workspace = 7;
	# 			"Mod+8".action.focus-workspace = 8;
	# 			"Mod+9".action.focus-workspace = 9;
	# 			"Mod+Ctrl+1".action.move-column-to-workspace =  1;
	# 			"Mod+Ctrl+2".action.move-column-to-workspace =  2;
	# 			"Mod+Ctrl+3".action.move-column-to-workspace =  3;
	# 			"Mod+Ctrl+4".action.move-column-to-workspace =  4;
	# 			"Mod+Ctrl+5".action.move-column-to-workspace =  5;
	# 			"Mod+Ctrl+6".action.move-column-to-workspace =  6;
	# 			"Mod+Ctrl+7".action.move-column-to-workspace =  7;
	# 			"Mod+Ctrl+8".action.move-column-to-workspace =  8;
	# 			"Mod+Ctrl+9".action.move-column-to-workspace =  9;
	#
	# 			"Mod+BracketLeft".action.consume-or-expel-window-left = {};
	# 			"Mod+BracketRight".action.consume-or-expel-window-right = {};
	# 			"Mod+Comma".action.consume-window-into-column = {};
	# 			"Mod+Period".action.expel-window-from-column = {};
	#
	# 			"Mod+R".action.switch-preset-column-width = {};
	# 			"Mod+Shift+R".action.switch-preset-column-width-back = {};
	# 			"Mod+Ctrl+Shift+R".action.switch-preset-window-height = {};
	# 			"Mod+Ctrl+R".action.reset-window-height = {};
	# 			"Mod+F".action.maximize-column = {};
	# 			"Mod+Shift+F".action.fullscreen-window = {};
	#
	# 			"Mod+M".action.maximize-window-to-edges = {};
	# 			"Mod+Ctrl+F".action.expand-column-to-available-width = {};
	#
	# 			"Mod+C".action.center-column = {};
	# 			"Mod+Ctrl+C".action.center-visible-columns = {};
	#
	# 			"Mod+Minus".action.set-column-width = "-10%";
	# 			"Mod+Equal".action.set-column-width = "+10%";
	# 			"Mod+Shift+Minus".action.set-window-height = "-10%";
	# 			"Mod+Shift+Equal".action.set-window-height = "+10%";
	#
	# 			"Mod+V".action.toggle-window-floating = {};
	# 			"Mod+Shift+V".action.switch-focus-between-floating-and-tiling = {};
	#
	# 			"Mod+Q".action.toggle-column-tabbed-display = {};
	#
	# 			"Print".action.screenshot = {};
	# 			"Ctrl+Print".action.screenshot-screen = {};
	# 			"Alt+Print".action.screenshot-window = {};
	#
	# 			"Mod+Escape" = {
	# 				allow-inhibiting=false;
	# 				action.toggle-keyboard-shortcuts-inhibit = {};
	# 			};
	#
	# 			"Mod+Delete".action.quit = {};
	# 			"Mod+Shift+P".action.power-off-monitors = {};
	# 		};
	# 	};
	# };
}
