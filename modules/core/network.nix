{ pkgs, host, ... }:

let
  tailscale-auth-key = builtins.toFile "tailscale-auth-key" "tskey-auth-kquZM7p3Fi11CNTRL-bXKsdGcmpedUSh3FjauKfdDrGN14Bko7P";
in
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
      "1.1.1.1"
    ];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        59010
        59011
      ];
      allowedUDPPorts = [
        59010
        59011
      ];
    };
  };

  services.tailscale = {
    enable = true;
    authKeyFile = tailscale-auth-key;
    extraUpFlags = [ "--ssh" ];
    extraSetFlags = [ "--advertise-exit-node" ];
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
