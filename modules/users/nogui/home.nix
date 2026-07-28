{ pkgs, ... }:
{
	imports = [
		../../home/home.nix
		../../home/dev.nix
		../../home/shell/fish.nix
	];

	home.username = "nogui";
	home.homeDirectory = "/home/nogui";
}
