{ ... }:
{
	networking.wg-quick.interfaces = {
		wg0 = {
			address = [ 
				"10.0.0.2/32"
			];
			# use dnscrypt, or proxy dns as described above
			# dns = [ "127.0.0.1" ];
			privateKeyFile = "/etc/wireguard/privatekey";

			peers = [
			{
# bt wg conf
				publicKey = "DExaBaxmISU989Gbe0zKuN6mDJ56jBqLbbji0ZNBbkQ=";
				allowedIPs = [
					"10.0.0.1/32"
				];
				endpoint = "cesareuh.fr:16383";
			}
			];
		};
	};
}

