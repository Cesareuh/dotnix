{ pkgs, inputs, config, ... }:
{
	home.file.".config/niri".source = config.lib.file.mkOutOfStoreSymlink /etc/dotnix/modules/home/wm/niri;
}
