{ pkgs, ... }:
{
  home.packages = with pkgs; [
    prismlauncher
    sameboy
    snes9x
    cemu
    dolphin-emu
    osu-lazer-bin
    gamemode
  ];
}
