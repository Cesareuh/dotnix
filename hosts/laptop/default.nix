inputs@{self, nixpkgs, ...}:

nixpkgs.lib.nixosSystem {
	specialArgs = {
		inherit inputs;
	};
	modules = [
		./hardware-configuration.nix

		../../modules/system/configuration.nix
		../../modules/system/audio.nix
		../../modules/system/desktop.nix
		../../modules/system/gaming.nix
		../../modules/system/laptop.nix
		../../modules/system/music.nix
		../../modules/system/gpu/nvidia.nix

		../../modules/users/jean/system.nix
		../../modules/users/jean/networking.nix

		inputs.musnix.nixosModules.musnix
		inputs.home-manager.nixosModules.home-manager {
			home-manager = {
				useGlobalPkgs = true;
				useUserPackages = true;
				extraSpecialArgs = { inherit inputs; };
				users.jean = import ../../modules/users/jean/home.nix;
			};
		}
	];
}
