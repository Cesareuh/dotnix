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
		# package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
		# 	version = "610.43.02";
		# 	sha256_64bit = "sha256:0qvllxnb20arjhw3bxdz0hw521di9ib75hldzx97gpscpdaa0d1h";
		# 	sha256_aarch64 = "sha256:0qvllxnb20arjhw3bxdz0hw521di9ib75hldzx97gpscpdaa0d1h";
		# 	openSha256 = "sha256-hP5NVZZ4vGsACHLmUDKq4uckpd/kn1GxCSYnnJfAuBs=";
		# 	settingsSha256 = "sha256-0YAhufRgjDW+uR+kjaTb154fibpcDw8QowfrucoZsKE=";
		# 	persistencedSha256 = "sha256:0nd0bf2s9b2ic8a0rcscddasddkryx2qf6mx4861bv44wblm513z"; 
		# };

		modesetting.enable = true;
		open = true;
		nvidiaSettings = true;

		prime = {
			offload.enable = true;
			offload.enableOffloadCmd = true;
			# sync.enable = true;
			# nvidiaBusId = "PCI:1:0:0";
			# intelBusId = "PCI:0:2:0";
			intelBusId = "PCI:0@0:2:0";
			nvidiaBusId = "PCI:1@0:0:0";
		};

		# powerManagement.enable = true;
		# powerManagement.finegrained = true;
	};

	environment.systemPackages = with pkgs; [
		nvtopPackages.nvidia
		btop-cuda
	];
}
