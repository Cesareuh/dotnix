{pkgs, inputs, ...}:
{
	environment.pathsToLink = ["/share/applications" "/share/xdg-desktop-portal"];

	hardware.bluetooth.enable = true;

	environment.variables = {
		XCURSOR_THEME = "Adwaita";
		XCURSOR_SIZE = "24";
	};

	programs.niri.enable = true;
	programs.dux-shell.enable = true;
	services.displayManager.dux-greeter = {
		enable = true;
		compositor.name = "niri";

		# Sync your user's DankMaterialShell theme with the greeter. You'll probably want this
		configHome = "/home/jean";
	};

	# Printing
	services.printing.enable = true;
	services.avahi = {
		enable = true;
		nssmdns4 = true;
		openFirewall = true;
	};
	services.printing.drivers = with pkgs; [ epson-escpr2 ];

	environment.systemPackages = with pkgs; [
		xwayland-satellite
	];
}
