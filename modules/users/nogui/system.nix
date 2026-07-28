{ pkgs, ... }:
{
	users.users.nogui = {
		isNormalUser = true;
		shell = pkgs.fish;
		extraGroups = [
			"wheel"
			"networkmanager"
			"audio"
		];
	};
}
