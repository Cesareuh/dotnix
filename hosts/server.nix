inputs@{self, nixpkgs, ...}:

nixpkgs.lib.nixosSystem {
	specialArgs = {
		inherit inputs;
	};
	modules = [
		../hardware-configuration.nix

		../modules/system/configuration.nix

		../modules/system/server/ssh.nix
		../modules/system/server/caddy.nix
		../modules/system/server/podman.nix

		../modules/users/nogui/system.nix
		../modules/users/nogui/networking.nix

		inputs.musnix.nixosModules.musnix
		inputs.home-manager.nixosModules.home-manager {
			home-manager = {
				useGlobalPkgs = true;
				useUserPackages = true;
				extraSpecialArgs = { inherit inputs; };
				users.nogui = import ../modules/users/nogui/home.nix;
			};
		}
	];

}
