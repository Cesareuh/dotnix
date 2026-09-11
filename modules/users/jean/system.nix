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

		dataDir = "/home/jean/Sync";

		user = "jean";
		group = "users";

		settings = {
			folders = {
				"Notes" = {
					path = "/home/jean/Notes";
				};
			};
		};
	};
}
