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
    # torzu: and now it's apparently gonna get DMCA'd
    shadps4_git
    heroic-unwrapped
    umu-launcher
    gamescope_git
    mangohud_git
  ];
}
