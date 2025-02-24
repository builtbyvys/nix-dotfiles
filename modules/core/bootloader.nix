{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  services.scx.enable = true;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernelModules = [
    "i2c-dev"
    "i2c-piix4"
  ];
}
