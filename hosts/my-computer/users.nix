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
      shell = pkgs.bash;
      ignoreShellProgramCheck = true;
      packages = with pkgs; [
        brave
        vesktop
        keepassxc
        chatterino2
        streamlink
        openrgb
        mpv
        foliate
        scrcpy
        opentabletdriver
        prismlauncher
        flameshot
        hyprshade
        python3
        zellij
        r2modman
        discord
        safeeyes
      ];
    };
  };
}
