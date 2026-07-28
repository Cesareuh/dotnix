{ inputs, pkgs, config, ... }:
{
	home.file.".config/DankMaterialShell/".source = config.lib.file.mkOutOfStoreSymlink "/etc/dotnix/modules/home/gui/dms";
	home.file.".config/wallpapers/".source = config.lib.file.mkOutOfStoreSymlink "/etc/dotnix/modules/home/gui/wallpapers";

	home.sessionVariables = {
		QT_QPA_PLATFORMTHEME = "qt6ct";
		QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
	};

	home.pointerCursor = {
		enable = true;
		gtk.enable = true;
		x11.enable = true;
		size = 24;
		name = "Vanilla-DMZ";
		package = pkgs.vanilla-dmz;
	};

	home.packages = with pkgs; [

		# Theming
		nerd-fonts.hack
		banana-cursor
		libsForQt5.qt5ct
		kdePackages.qt6ct
		adwaita-icon-theme
		adw-gtk3

		# Desktop
		libreoffice

		# Audio packages
		pwvucontrol
		qpwgraph

		# Music
		alsa-scarlett-gui
		ardour
		reaper
		x42-plugins
		calf
		lsp-plugins
		guitarix
		distrho-ports
		tuxguitar

		# Other
		baobab
		legcord
		inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
		qbittorrent
		xdg-desktop-portal-gnome
		mpv
		mangohud

		(callPackage ./pkgs/davinci-resolve.nix {studioVariant = true;})

		# Gaming
		faugus-launcher
		wineWow64Packages.stable
	] ++ pkgs.comixcursors.all;

	programs = {
		ghostty = {
			enable = true;
			enableFishIntegration = true;
			settings.theme = "dankcolors";
		};
	};
}
