{
  pkgs,
  username,
  ...
}:

let
  inherit (import ./variables.nix) gitUsername;
in
{
  users.users = {
    "${username}" = {
      homeMode = "755";
      isNormalUser = true;
      description = "${gitUsername}";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
        "adbusers"
        "gamemode"
      ];
      shell = pkgs.fish;
      ignoreShellProgramCheck = true;
      packages = with pkgs; [
        brave
        vesktop
        keepassxc
        chatterino7
        streamlink
        openrgb
        mpv
        foliate
        scrcpy
        prismlauncher
        flameshot
        hyprshade
        python3
        zellij
        r2modman
        discord
        safeeyes
        stremio
        osu-lazer-bin
        lutris
        protonup-qt
        obs-cmd
        mangohud
        pnpm
        nodejs
        shadps4
        qemu
        graalvm-ce
        rustc
        rust-analyzer
      ];
    };
  };
}
