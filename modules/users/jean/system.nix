{ pkgs, ... }:
{
	users.users.jean = {
		isNormalUser = true;
		shell = pkgs.fish;
		extraGroups = [
			"wheel"
			"networkmanager"
			"audio"
		];
	};
}
