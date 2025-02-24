{
  pkgs,
  config,
  ...
}: {
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        (vaapiIntel.override {enableHybridCodec = true;})
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };
  hardware.enableRedistributableFirmware = true;
  hardware.opentabletdriver.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
  hardware.nvidia.open = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
  };
}
