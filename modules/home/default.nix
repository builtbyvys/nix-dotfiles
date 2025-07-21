{ ... }: {
  imports = [
    ./aseprite/aseprite.nix # pixel art editor
    ./audacious.nix # music player
    ./bat.nix # better cat command
    ./browser.nix # firefox based browser
    ./btop.nix # resouces monitor
    ./cava.nix # audio visualizer
    ./discord.nix # nixcord
    ./fastfetch.nix # fetch tool
    ./fzf.nix # fuzzy finder
    ./gaming.nix # packages related to gaming
    ./git.nix # version control
    ./gnome.nix # gnome apps
    ./jellyfin.nix
    ./kitty.nix # terminal
    ./lazygit.nix
    ./micro.nix # nano replacement
    ./nemo.nix # file manager
    ./obsidian.nix
    ./p10k/p10k.nix
    ./packages.nix # other packages
    #./retroarch.nix
    ./rofi.nix # launcher
    ./scripts/scripts.nix # personal scripts
    ./spicetify.nix # spotify client
    ./starship.nix # shell prompt
    # ./viewnior.nix                    # image viewer
    ./vr.nix
    ./xdg-mimes.nix # xdg config
    ./yazi.nix # terminal file manager
    ./zsh # shell
    ./catppuccin.nix
  ];
}
