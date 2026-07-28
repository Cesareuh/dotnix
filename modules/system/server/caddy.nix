{ pkgs, ... }:
{
	services.caddy = {
		enable = true;
		virtualHosts."cesareuh.fr".extraConfig = ''
			respond "C'EST MOI CESAREUUUUUH"
		'';
		virtualHosts."vw.cesareuh.fr".extraConfig = ''
			reverse_proxy http://127.0.0.1:1231
		'';
		virtualHosts."wireguard.cesareuh.fr".extraConfig = ''
			respond "C'EST MOI CESAREUUUUUH"
			reverse_proxy http://127.0.0.1:51820
		'';
		virtualHosts."cloud.cesareuh.fr".extraConfig = ''
			reverse_proxy http://127.0.0.1:9200
		'';
		virtualHosts."wopiserver.cesareuh.fr".extraConfig = ''
			reverse_proxy http://127.0.0.1:9300
		'';
		virtualHosts."collabora.cesareuh.fr".extraConfig = ''
			reverse_proxy http://127.0.0.1:9980
		'';
	};
}
