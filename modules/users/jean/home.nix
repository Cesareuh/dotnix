{ pkgs, ... }:
{
	imports = [
		../../home/home.nix
		../../home/dev.nix
		../../home/gui/gui.nix
		../../home/shell/fish.nix
		../../home/shell/starship.nix
		../../home/wm/niri.nix
	];

	home.username = "jean";
	home.homeDirectory = "/home/jean";

	home.file.".profile".text = ''
		if [ "$(tty)" = "/dev/tty1" ]; then
			exec niri-session
		fi
	'';

	home.packages = with pkgs; [
		# CLI apps
		brightnessctl
		ffmpeg
		p7zip
		unrar
	];
}
