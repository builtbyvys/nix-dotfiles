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
    r2modman
    torzu
    shadps4_git
    heroic-unwrapped
    umu-launcher-unwrapped
    gamescope_git
    mangohud_git
  ];
}
