{...}:
{
	powerManagement.enable = true;
	# services.tlp.enable = true;

	services.upower.enable = true;

	services.logind = {
		enable = true;
		settings = {
			Login = {
				HandleLidSwitch = "ignore";
				HandlePowerKey = "poweroff";
				KillUserProcesses = false;
			};
		};
	};
}
