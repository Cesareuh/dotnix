{ lib, ... }:
{
	programs = {

		fish.interactiveShellInit = lib.mkAfter ''
				starship init fish | source
			'';

		starship = {
			enable = true;
			settings = {
				format = "$all";
				os = {
					disabled = false;
					format = "$symbol";
					symbols = {
						NixOS = "[ ](bold cyan)";
					};
				};
				directory = {
					style = "bold orange";
					read_only = " 󰌾";
				};
				character = {
					success_symbol = "[❯](bold green)";
					error_symbol = "[❯](bold red)";
					vimcmd_symbol = "[❮](bold green)";
					vimcmd_replace_one_symbol = "[❮](bold purple)";
					vimcmd_replace_symbol = "[❮](bold orange)";
					vimcmd_visual_symbol = "[❮](bold cyan)";
				};
				battery.disabled = true;
			};
		};
	};
}
