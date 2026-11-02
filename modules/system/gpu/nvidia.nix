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
		package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
			version = "615.78.08";
			sha256_64bit = "sha256-Pj9t3cLudnoIGFMAr3vjyyhuznZpjS3eNSRZl4LQf/4=";
			# sha256_aarch64 = "sha256-xctt4TPRlOJ6r5S54h5W6PT6/3Zy2R4ASNFPu8TSHKM=";
			openSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
			settingsSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
			persistencedSha256 = lib.fakeSha256;
		};

		modesetting.enable = true;
		open = false;
		nvidiaSettings = true;

		prime = {
			offload.enable = true;
			offload.enableOffloadCmd = true;
			# sync.enable = true;
			intelBusId = "PCI:0@0:2:0";
			nvidiaBusId = "PCI:1@0:0:0";
		};
	};

	environment.systemPackages = with pkgs; [
		nvtopPackages.nvidia
		btop-cuda
	];
}
