{ pkgs, ... }:
{
	virtualisation.podman = {
		enable = true;
		defaultNetwork.settings.dns_enabled = true;
	};

	environment.defaultPackages = with pkgs; [
		podman-compose
	];

	virtualisation.oci-containers.containers = {
		vaultwarden = {
			image = "docker.io/vaultwarden/server:1.37.0";
			serviceName = "vaultwarden";
			autoStart = true;
			ports = ["1231:80"];
			environment.DOMAIN = "https://vw.cesareuh.fr";
			volumes = [ "/srv/data/vaultwarden/:/data/" ];
		};
	};
}
