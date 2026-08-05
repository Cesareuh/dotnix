{ pkgs, ... }:
{
	virtualisation.podman = {
		enable = true;
		defaultNetwork.settings.dns_enabled = true;
	};

	environment.defaultPackages = with pkgs; [
		podman-compose
	];

	services.collabora-online = {
		enable = true;
		port = 9980; # default
			settings = {
				# Rely on reverse proxy for SSL
				ssl = {
					enable = false;
					termination = true;
				};

				# Listen on loopback interface only, and accept requests from ::1
				# net = {
				# 	listen = "loopback";
				# 	post_allow.host = ["::1"];
				# };

				# Restrict loading documents from WOPI Host nextcloud.example.com
				storage.wopi = {
					"@allow" = true;
					host = ["cloud.cesareuh.fr"];
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

	virtualisation.oci-containers.containers = {
		vaultwarden = {
			image = "docker.io/vaultwarden/server:1.37.0";
			serviceName = "vaultwarden";
			autoStart = true;
			ports = ["1231:80"];
			volumes = [ "/srv/data/vaultwarden/:/data/" ];
			environment.DOMAIN = "https://vw.cesareuh.fr";
		};

# opencloud = {
# 	image = "docker.io/opencloudeu/opencloud-rolling:7.3.0";
# 	user = "1000:1000";
# 	autoStart = true;
# 	ports = [ "9200:9200" ];
# 	entrypoint = "/bin/sh";
# 	cmd = [ "-c" "opencloud init" ];
# 	volumes = [ 
# 		"/srv/data/opencloud/data:/var/lib/opencloud"
# 		"/srv/data/opencloud/config:/etc/opencloud"
# 	];
# 	environmentFiles = [ "/srv/env/opencloud.env" ];
# };

# ---------------- NEXTCLOUD

# redis = {
# 	image = "docker.io/redis:alpine";
# 	autoStart = true;
# };
#
# db = {
# 	image = "docker.io/postgres:18.4";
# 	autoStart = true;
# 	volumes = [ "/srv/data/postgres:/var/lib/postgresql" ];
# 	environmentFiles = [ "/srv/env/postgres.env" ];
# };
#
# nextcloud = {
# 	image = "docker.io/nextcloud:34.0.2-fpm";
# 	autoStart = true;
# 	dependsOn = [ "db" "redis" ];
# 	volumes = [ "/srv/data/nextcloud:/var/www/html" ];
# 	environment = {
# 		POSTGRES_HOST = "db";
# 		REDIS_HOST = "redis";
# 	};
# 	environmentFiles = [ "/srv/env/nextcloud.env" ];
# };

	};
}
