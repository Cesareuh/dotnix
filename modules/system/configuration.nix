{ config, inputs, lib, pkgs, ... }:

{
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.kernelPackages = pkgs.linuxPackages_latest;

	nixpkgs.config.allowUnfree = true;

	networking.networkmanager.enable = true;

	time.timeZone = "Europe/Paris";

	programs.bash.enable = true;
	programs.fish.enable = true;

	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};

	environment.systemPackages = with pkgs; [
		git
		tmux
		cryptsetup
		_7zz
		zip
		unzip
	];

	system.stateVersion = "25.11";
}

