{ inputs, pkgs, config, ... }:
{

	imports = [
		inputs.dcal.homeModules.dank-calendar
	];

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

	programs.dank-calendar.enable = true;

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
		obsidian

		# Audio packages
		pwvucontrol
		qpwgraph

		# Music
		alsa-scarlett-gui
		ardour
		x42-plugins
		calf
		lsp-plugins
		guitarix
		distrho-ports
		tuxguitar

		# Cours 
		# rstudio
		pgadmin4-desktopmode

		# Other
		# vscodium
		vscode
		baobab
		discord
		deezer-desktop
		# legcord
		inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
		qbittorrent
		xdg-desktop-portal-gnome
		mpv

		# davinci-resolve
		# (callPackage ./pkgs/davinci-resolve.nix {studioVariant = true;})
		(callPackage ./pkgs/davinci-resolve-free.nix {studioVariant = false;})
		kdePackages.kdenlive

		# Gaming
		faugus-launcher
		mangohud
		wineWow64Packages.stable
	] ++ pkgs.comixcursors.all;

	programs = {
		# ghostty = {
		# 	enable = true;
		# 	enableFishIntegration = true;
		# 	settings.theme = "dankcolors";
		# };
		kitty = {
			enable = true;
			shellIntegration.enableFishIntegration = true;
			font.name = "Hack Nerd Font";

			extraConfig = ''
			include ~/.config/kitty/dank-theme.conf
			include ~/.config/kitty/dank-tabs.conf
			'';
		};
		obs-studio = {
			enable = true;

			package = ( 
				pkgs.obs-studio.override {
					cudaSupport = true;
				}
			);

			plugins = with pkgs.obs-studio-plugins; [
				droidcam-obs
			];
		};
	};
}
