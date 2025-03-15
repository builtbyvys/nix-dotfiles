{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.sbctl ];

  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos;
    kernelModules = [
      "i2c-dev"
      "i2c-piix4"
    ];
    kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
    };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    supportedFilesystems = [ "ntfs" ];
  };
}
