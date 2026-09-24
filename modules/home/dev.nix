{ config, pkgs, ... }:
{
	home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/etc/dotnix/modules/home/nvim";

	home.packages = with pkgs; [
		lua-language-server
		nixd
		ripgrep
	];

	programs = {
		direnv = {
			enable = true;
			enableFishIntegration = true; # see note on other shells below
			nix-direnv.enable = true;
		};
	};
}
