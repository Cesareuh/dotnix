{ lib, pkgs, config, ...}:
{
	# Enable OpenGL
	hardware.graphics = {
		enable = true;
	};

	# Load nvidia driver for Xorg and Wayland
	services.xserver.videoDrivers = [
		"modesetting"
		"nvidia"
	];

	hardware.nvidia = {
		modesetting.enable = true;
		open = true;
		nvidiaSettings = true;

		prime = {
			offload.enable = true;
			offload.enableOffloadCmd = true;
			intelBusId = "PCI:0@0:2:0";
			nvidiaBusId = "PCI:1@0:0:0";
		};
	};

	environment.systemPackages = with pkgs; [
		nvtopPackages.nvidia
		btop-cuda
	];
}
