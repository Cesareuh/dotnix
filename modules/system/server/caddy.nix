{ pkgs, ... }:
{
	services.caddy = {
		enable = true;
		virtualHosts."cesareuh.fr".extraConfig = ''
			respond "C'EST MOI CESAREUUUUUH"
		'';
		virtualHosts."immich.cesareuh.fr".extraConfig = ''
			reverse_proxy http://[::1]:2283
		'';
		virtualHosts."vw.cesareuh.fr".extraConfig = ''
			reverse_proxy http://127.0.0.1:1231
		'';
		virtualHosts."stats.cesareuh.fr".extraConfig = ''
			reverse_proxy http://127.0.0.1:9020
		'';
		virtualHosts."sync.cesareuh.fr".extraConfig = ''
			reverse_proxy http://127.0.0.1:8384
		'';
		virtualHosts."office.cesareuh.fr".extraConfig = ''
			reverse_proxy http://127.0.0.1:9980
		'';
		virtualHosts."cloud.cesareuh.fr".extraConfig = ''
			reverse_proxy http://127.0.0.1:9200
		'';
	};
}
