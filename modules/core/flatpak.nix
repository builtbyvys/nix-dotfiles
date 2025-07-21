{ inputs, ... }:
{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak = {
    enable = true;
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
    packages = [
      # "io.github.zen_browser.zen"
      "com.github.tchx84.Flatseal"
      "io.github.everestapi.Olympus"
      "org.vinegarhq.Sober"
      "org.vinegarhq.Vinegar"
      "com.cakewallet.CakeWallet"
    ];
    overrides = {
      global = {
        # Force Wayland by default
        Context.sockets = [
          "wayland"
          "!x11"
          "!fallback-x11"
        ];
      };
    };
  };
}
