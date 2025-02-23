{ pkgs, ... }:
{
  programs.adb.enable = true;
  users.users.yamil.extraGroups = [ "adbusers" ];
  services.udev.packages = [ pkgs.android-udev-rules ];
}
