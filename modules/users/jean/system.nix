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

	services.syncthing = {
		enable = true;
		openDefaultPorts = true;

		dataDir = "/home/jean/.config/syncthing";

		user = "jean";
		group = "users";

	};
}
