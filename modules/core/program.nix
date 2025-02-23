{ pkgs, ... }:
{
  programs = {
    kdeconnect.enable = true;
    dconf.enable = true;
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [ ];
    };
  };
}
