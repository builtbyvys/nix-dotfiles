{ ... }:
{
  imports = [
    ./adb.nix
    ./bootloader.nix
    ./catppuccin.nix
    #./openrgb-udev-rules.nix
    ./hardware.nix
    ./xserver.nix
    ./network.nix
    ./nh.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./steam.nix
    ./sunshine.nix
    ./system.nix
    ./flatpak.nix
    ./user.nix
    ./virtualization.nix
  ];
}
