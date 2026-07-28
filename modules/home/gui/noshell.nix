{ inputs, pkgs, config, ... }:
{
	programs = {
		ashell = {
			enable = true;
			settings = {
				appearance = {
					style = "Islands";
					scale_factor = 1.25;
				};
				modules = {
					left = [
						"Workspaces"
					];
					center = [
						"WindowTitle"
					];
					right = [
						[
							"Tray"
							"Tempo"
							"Settings"
						]
					];
				};
			};
		};

		fuzzel = {
			enable = true;
			settings = {
				main = {
					width = 50;
					lines = 10;
					# icon-theme = "Papirus-Dark";
				};
				border.width = 2;
			};
		};
	};

	services = {
		dunst = {
			enable = true;
			settings = {
				global = {
					follow = "mouse";
				};
			};
		};
	};
}
