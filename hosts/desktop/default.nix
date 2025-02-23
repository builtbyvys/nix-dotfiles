{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
}
