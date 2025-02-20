{ pkgs
, username
, host
, ...
}:
let
  inherit (import ./variables.nix) gitUsername gitEmail;
in
{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.11";

  imports = [
    ../../config/emoji.nix
    ../../config/fastfetch
    ../../config/hyprland.nix
    ../../config/rofi/rofi.nix
    ../../config/rofi/config-emoji.nix
    ../../config/rofi/config-long.nix
    ../../config/swaync.nix
    ../../config/waybar.nix
    ../../config/wlogout.nix
  ];

  home.file."Pictures/Wallpapers" = {
    source = ../../config/wallpapers;
    recursive = true;
  };

  home.file.".config/wlogout/icons" = {
    source = ../../config/wlogout;
    recursive = true;
  };

  home.file.".face.icon".source = ../../config/face.jpg;
  home.file.".config/face.jpg".source = ../../config/face.jpg;

  home.file.".config/swappy/config".text = ''
    [Default]
    save_dir=/home/${username}/Pictures/Screenshots
    save_filename_format=swappy-%Y%m%d-%H%M%S.png
    show_panel=false
    line_size=5
    text_size=20
    text_font=Ubuntu
    paint_mode=brush
    early_exit=true
    fill_shape=false
  '';

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  stylix.targets.waybar.enable = false;
  stylix.targets.rofi.enable = false;
  stylix.targets.hyprland.enable = false;

  gtk = {
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
  };

  home.packages = [
    pkgs.mpvScripts.uosc
    pkgs.mpvScripts.autocrop
    pkgs.mpvScripts.autoload
    pkgs.mpvScripts.mpv-webm
    pkgs.mpvScripts.thumbfast
    (import ../../scripts/emopicker9000.nix { inherit pkgs; })
    (import ../../scripts/task-waybar.nix { inherit pkgs; })
    (import ../../scripts/squirtle.nix { inherit pkgs; })
    (import ../../scripts/nvidia-offload.nix { inherit pkgs; })
    (import ../../scripts/wallsetter.nix {
      inherit pkgs;
      inherit username;
    })
    (import ../../scripts/web-search.nix { inherit pkgs; })
    (import ../../scripts/rofi-launcher.nix { inherit pkgs; })
    (import ../../scripts/screenshootin.nix { inherit pkgs; })
    (import ../../scripts/list-hypr-bindings.nix {
      inherit pkgs;
      inherit host;
    })
  ];

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };

    hypridle = {
      settings = {
        general = {
          after_sleep_cmd = "hyprctl dispatch dpms on";
          ignore_dbus_inhibit = false;
          lock_cmd = "hyprlock";
        };
        listener = [
          {
            timeout = 900;
            on-timeout = "hyprlock";
          }
          {
            timeout = 1200;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };

  programs = {
    git = {
      enable = true;
      userName = "${gitUsername}";
      userEmail = "${gitEmail}";
    };

    gh = {
      enable = true;
    };

    btop = {
      enable = true;
      settings = {
        vim_keys = true;
      };
    };

    kitty = {
      enable = true;
      package = pkgs.kitty;
      settings = {
        scrollback_lines = 2000;
        wheel_scroll_min_lines = 1;
        window_padding_width = 4;
        confirm_os_window_close = 0;
      };
      extraConfig = ''
        tab_bar_style fade
        tab_fade 1
        active_tab_font_style   bold
        inactive_tab_font_style bold
      '';
    };

    starship = {
      enable = true;
      package = pkgs.starship;
    };

    fish = {
      enable = true;
      shellInit = ''
        export PATH="$HOME/.cargo/bin:$PATH"
        fastfetch
      '';
      interactiveShellInit = ''
        if test -f ~/.config/fish/config.fish-personal
          source ~/.config/fish/config.fish-personal
        end
      '';
      shellAliases = {
        sv = "sudo nvim";
        fr = "nh os switch --hostname ${host} /home/${username}/nix";
        fu = "nh os switch --hostname ${host} --update /home/${username}/nix";
        ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
        v = "nvim";
        cat = "bat";
        ls = "eza --icons";
        ll = "eza -lh --icons --grid --group-directories-first";
        la = "eza -lah --icons --grid --group-directories-first";
        ".." = "cd ..";
      };
    };

    mpv = {
      enable = true;
      scripts = with pkgs.mpvScripts; [
        uosc
        autocrop
        autoload
        mpv-webm
        thumbfast
        memo
        quality-menu
      ];
    };
  };

  home.file = {
    ".config/mpv/input.conf" = { source = ../../config/mpv/input.conf; };
    ".config/mpv/mpv.conf" = { source = ../../config/mpv/mpv.conf; };
    ".config/mpv/profiles.conf" = { source = ../../config/mpv/profiles.conf; };
    ".config/mpv/cache" = {
      source = ../../config/mpv/cache;
      recursive = true;
    };
    ".config/mpv/fonts" = {
      source = ../../config/mpv/fonts;
      recursive = true;
    };
    ".config/mpv/script-opts" = {
      source = ../../config/mpv/script-opts;
      recursive = true;
    };
    ".config/mpv/scripts" = {
      source = ../../config/mpv/scripts;
      recursive = true;
    };
    ".config/mpv/shaders" = {
      source = ../../config/mpv/shaders;
      recursive = true;
    };
  };
}
