inputs@{self, nixpkgs, ...}:

nixpkgs.lib.nixosSystem {
	specialArgs = {
		inherit inputs;
	};
	modules = [
		./hardware-configuration.nix
		./networking.nix

		../../modules/system/configuration.nix

		../../modules/system/server/caddy.nix
		../../modules/system/server/services.nix
		../../modules/system/server/etc.nix
		../../modules/system/server/ssh.nix

		../../modules/users/nogui/system.nix
	];
}
