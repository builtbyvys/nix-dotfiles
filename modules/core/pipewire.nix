{ pkgs, config, ... }:
{
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    extraConfig.pipewire."99lowlatency" = {
      context.properties = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 64;
        "default.clock.min-quantum" = 64;
        "default.clock.max-quantum" = 64;
        "default.clock.force-quantum" = 64;
      };
    };

    extraConfig.pipewire-pulse."99-lowlatency" = {
      context.modules = [
        {
          name = "libpipewire-module-protocol-pulse";
          args = {
            "pulse.min.req" = "64/48000";
            "pulse.default.req" = "64/48000";
            "pulse.max.req" = "64/48000";
            "pulse.min.quantum" = "64/48000";
            "pulse.max.quantum" = "64/48000";
          };
        }
      ];
      stream.properties = {
        resample.quality = 1;
      };
    };
  };

  environment.systemPackages = with pkgs; [ pulseaudioFull ];
}
