{ pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  powerManagement.cpuFreqGovernor = "performance";

  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

  environment.systemPackages = with pkgs; [
    sbctl
    cider-2
  ];
}
