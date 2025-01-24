{ config, lib, pkgs, ... }:

let
  cfg = config.programs.sunshine;
  sunshineWithCuda = pkgs.sunshine.override {
    cudaSupport = true;
    stdenv = pkgs.cudaPackages.backendStdenv;
  };
  patched-pkgs = pkgs.applyPatches {
    src = pkgs.path;
    patches = [
      (pkgs.fetchpatch {
        url = "https://github.com/NixOS/nixpkgs/commit/2364607ec91c0aa8f5028aead070ead6da27007b.patch";
        sha256 = "sha256-0j0g2br1xc0pnx4hilf0663ghvrhgri80y8zxf72zik498bbh2v3";
      })
    ];
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
