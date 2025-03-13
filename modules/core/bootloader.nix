{ pkgs, lib, ... }:
let
  sources = import ../../nix/sources.nix;
  lanzaboote = import sources.lanzaboote;
in
{
  imports = [ lanzaboote.nixosModules.lanzaboote ];

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
      systemd-boot.enable = lib.mkForce false;
      efi.canTouchEfiVariables = true;
    };

    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
      configurationLimit = 10;
    };

    supportedFilesystems = [ "ntfs" ];
  };
}
