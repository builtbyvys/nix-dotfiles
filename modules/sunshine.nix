{ config, lib, pkgs, ... }:

let
  nixpkgsTarball = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/2364607ec91c0aa8f5028aead070ead6da27007b.tar.gz";
    sha256 = "04fsylz7f8770cykk0wvdkp3ml5pqha3l3xlzpqb26w3zxcmkyl5";
  };
  pkgs-master = import nixpkgsTarball {
    system = builtins.currentSystem or "x86_64-linux";
    config = { allowUnfree = true; };
  };
  cfg = config.programs.sunshine;
  sunshineWithCuda = pkgs-master.sunshine.override {
    cudaSupport = true;
    stdenv = pkgs.cudaPackages.backendStdenv;
  };
in
{
  options.programs.sunshine = with lib; {
    enable = mkEnableOption "sunshine";
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.allowedTCPPortRanges = [{ from = 47984; to = 48010; }];
    networking.firewall.allowedUDPPortRanges = [{ from = 47998; to = 48010; }];
    security.wrappers.sunshine = {
      owner = "root";
      group = "root";
      capabilities = "cap_sys_admin+p";
      source = "${sunshineWithCuda}/bin/sunshine";
    };
    systemd.user.services.sunshine = {
      description = "Sunshine self-hosted game stream host for Moonlight";
      startLimitBurst = 5;
      startLimitIntervalSec = 500;
      serviceConfig = {
        ExecStart = "${config.security.wrapperDir}/sunshine";
        Restart = "on-failure";
        RestartSec = "5s";
      };
    };
  };
}
