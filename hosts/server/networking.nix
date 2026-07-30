{ ... }:
{
	networking.wg-quick.interfaces = {
		wg0 = {
			address = [ 
				"10.0.0.1/32"
			];
			# dns = [ "127.0.0.1" ];
			privateKeyFile = "/etc/wireguard/privatekey";
			listenPort = 51820;

			peers = [
			{
				publicKey = "WCZDAf+c+InnEwqcOyVV5qabnGc4BYf+BEz0AwMdIxI=";
				allowedIPs = [
					"10.0.0.2/32"
				];
			}
			];
		};
	};
	networking.firewall = {
		allowedTCPPorts = [ 80 443 ];
		trustedInterfaces = [ "wg0" ];
		allowedUDPPorts = [ 51820 ];
	};		
}
