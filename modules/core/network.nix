{ pkgs, host, ... }:
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
    extraUpFlags = [ "--ssh" ];
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
