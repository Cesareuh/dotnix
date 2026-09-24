{pkgs, inputs, ...}:
{
	environment.pathsToLink = ["/share/applications" "/share/xdg-desktop-portal"];

	hardware.bluetooth.enable = true;

	environment.variables = {
		XCURSOR_THEME = "Adwaita";
		XCURSOR_SIZE = "24";
	};

	programs.niri.enable = true;
	programs.dms-shell.enable = true;
	services.displayManager.dms-greeter = {
		enable = true;
		compositor.name = "niri";

		# Sync your user's DankMaterialShell theme with the greeter. You'll probably want this
		configHome = "/home/jean";
	};

	environment.systemPackages = with pkgs; [
		xwayland-satellite
	];
}
