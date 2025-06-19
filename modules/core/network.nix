{ pkgs, host, ... }:
let
  tailscale-auth-key = builtins.toFile "tailscale-auth-key" "tskey-auth-kquZM7p3Fi11CNTRL-bXKsdGcmpedUSh3FjauKfdDrGN14Bko7P";
in
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    nameservers = [
      "9.9.9.9"
      "149.112.112.112"
    ];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        41454
        59010
        59011
        59401
      ];
      allowedUDPPorts = [
        41454
        59010
        59011
        59401
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
