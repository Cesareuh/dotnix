{ pkgs, ... }:
{
	virtualisation.podman = {
		enable = true;
		defaultNetwork.settings.dns_enabled = true;
	};

	environment.defaultPackages = with pkgs; [
		podman-compose
	];

	services.immich = {
		enable = true;
		port = 2283;
		mediaLocation = "/srv/data/immich";
	};

	services.beszel.hub = {
		enable = true;
		port = 9020;
	};
	services.beszel.agent = {
		enable = true;
		environmentFile = "/srv/env/beszel.env";
	};

	services.syncthing = {
		enable = true;
		openDefaultPorts = true;

		dataDir = "/srv/data/syncthing";

		guiAddress = "0.0.0.0:8384";

		guiPasswordFile = "/srv/env/syncthing.passwd";
		settings = {
			gui.user = "syncthing";

				folders = {
					"Notes" = {
						path = "/srv/data/syncthing/Notes";
					};
				};
		};

	};

	# networking.firewall.allowedTCPPorts = [ 8384 ];

	services.collabora-online = {
		enable = true;
		port = 9980; # default
			settings = {
				# Rely on reverse proxy for SSL
				ssl = {
					enable = false;
					termination = true;
				};

				# net = {
				# 	listen = "127.0.0.1";
				# 	proto = "IPv4";
				# 	proxy_prefix = true;
				# };

				# Restrict loading documents from WOPI Host nextcloud.example.com
				storage.wopi = {
					"@allow" = true;
					host = [
						"cloud.cesareuh.fr"
						"https://cloud.cesareuh.fr"
					];
				};

				# Set FQDN of server
				server_name = "office.cesareuh.fr";
			};
	};

	services.opencloud = {
		enable = true;
		url = "https://cloud.cesareuh.fr";
		stateDir = "/srv/data/opencloud/data";
		address = "127.0.0.1";
		port = 9200;
		environment = { 
			OC_CONFIG_DIR = "/srv/data/opencloud/config";
			PROXY_TLS = "false";
		};
		environmentFile = "/srv/env/opencloud.env";

		settings = {
# An override of the default CSP: every parameter has to be re-written, default can be found on opencloud's compose files
			csp = {                                      
				directives = {
					child-src = [
						"'self'"
					];

					connect-src = [
						"'self'"
						"blob:"
						"https://\${COMPANION_DOMAIN|companion.opencloud.test}\${TRAEFIK_PORT_HTTPS}/"
						"wss://\${COMPANION_DOMAIN|companion.opencloud.test}\${TRAEFIK_PORT_HTTPS}/"
						"https://raw.githubusercontent.com/opencloud-eu/awesome-apps/"
						"https://\${IDP_DOMAIN|keycloak.opencloud.test}\${TRAEFIK_PORT_HTTPS}/"
						"https://update.opencloud.eu/"
					];
					default-src = [
						"'none'"
					];
					font-src = [
						"'self'"
					];
					frame-ancestors = [
						"'self'"
					];
					frame-src = [
						"'self'"
						"blob:"
						"https://embed.diagrams.net"

# Here is the culprit, put your own office service's URL
						"https://office.cesareuh.fr"

# This is needed for the external-sites web extension when embedding sites
						"https://docs.opencloud.eu"
					];
					img-src = [
						"'self'"
						"data:"
						"blob:"
						"https://raw.githubusercontent.com/opencloud-eu/awesome-apps/"
						"https://tile.openstreetmap.org/"
					];
					manifest-src = [
						"'self'"
					];

					media-src = [
						"'self'"
					];

					object-src = [
						"'self'"
						"blob:"
					];

					script-src = [
						"'self'"
						"'unsafe-inline'"
						"https://\${IDP_DOMAIN|keycloak.opencloud.test}\${TRAEFIK_PORT_HTTPS}/"
					];

					style-src = [
						"'self'"
						"'unsafe-inline'"
					];
				};
			};

			proxy = {
			# Tell your proxy to look at that CSP file you created
				csp_config_file_location = "/etc/opencloud/csp.yaml";           
			};
		};
	};

	systemd.services.opencloud-init-config.serviceConfig.ReadWritePaths = [
		"/srv/data/opencloud"
	];

	systemd.tmpfiles.rules = [
		"L+ /srv/data/opencloud/config/csp.yaml - - - - /etc/opencloud/csp.yaml"
		"L+ /srv/data/opencloud/config/proxy.yaml - - - - /etc/opencloud/proxy.yaml"
	];

	# A transformer en nix natif
	virtualisation.oci-containers.containers = {
		vaultwarden = {
			image = "docker.io/vaultwarden/server:1.37.0";
			serviceName = "vaultwarden";
			autoStart = true;
			ports = ["1231:80"];
			volumes = [ "/srv/data/vaultwarden/:/data/" ];
			environment.DOMAIN = "https://vw.cesareuh.fr";
		};
	};
}
