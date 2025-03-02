{
 lib,
 ...
}: {
  # networking.firewall = {
  #   allowedUDPPorts = [ 51820 ];
  # };
  #
  # networking.wireguard.interfaces = {
  #   wg0 = let
  #     file = builtins.readFile /home/michaell/vpn/wg/wg0.json;
  #     cfg = builtins.fromJSON file;
  #   in {
  #     ips = [ cfg.Interface.Address ];
  #
  #     listenPort = 51820;
  #
  #     privateKey = cfg.Interface.PrivateKey;
  #
  #     peers = [
  #       {
  #         publicKey = cfg.Peer.PublicKey;
  #         allowedIPs = [ cfg.Peer.AllowedIPs ];
  #         endpoint = cfg.Peer.Endpoint;
  #         persistentKeepalive = lib.strings.toInt cfg.Peer.PersistentKeepalive;
  #       }
  #     ];
  #   };
  #   wg1 = let
  #     file = builtins.readFile /home/michaell/vpn/wg/sydney.json;
  #     cfg = builtins.fromJSON file;
  #   in {
  #     ips = [ cfg.Interface.Address ];
  #
  #     listenPort = 51821;
  #
  #     privateKey = cfg.Interface.PrivateKey;
  #
  #     peers = [
  #       {
  #         publicKey = cfg.Peer.PublicKey;
  #         allowedIPs = [ cfg.Peer.AllowedIPs ];
  #         endpoint = cfg.Peer.Endpoint;
  #         persistentKeepalive = lib.strings.toInt cfg.Peer.PersistentKeepalive;
  #       }
  #     ];
  #   };
  # };
}
