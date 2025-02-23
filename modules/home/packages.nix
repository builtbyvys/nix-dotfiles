{
  inputs,
  pkgs,
  ...
}: let
in {
  home.packages = (
    with pkgs; [
      ## CLI utility
      ani-cli
      binsider
      bitwise # cli tool for bit / hex manipulation
      caligula # User-friendly, lightweight TUI for disk imaging
      dconf-editor
      docfd # TUI multiline fuzzy document finder
      eza # ls replacement
      entr # perform action when file change
      fd # find replacement
      ffmpeg
      file # Show file information
      gtt # google translate TUI
      gifsicle # gif utility
      gtrash # rm replacement, put deleted files in system trash
      hexdump
      htop
      imv # image viewer
      jq # JSON processor
      killall
      libnotify
      man-pages # extra man pages
      mimeo
      mpv # video player
      ncdu # disk space
      nitch # systhem fetch util
      nixd # nix lsp
      nixfmt-rfc-style # nix formatter
      openssl
      onefetch # fetch utility for git repo
      pamixer # pulseaudio command line mixer
      playerctl # controller for media players
      poweralertd
      programmer-calculator
      ripgrep # grep replacement
      shfmt # bash formatter
      swappy # snapshot editing tool
      tdf # cli pdf viewer
      treefmt2 # project formatter
      tldr
      todo # cli todo list
      toipe # typing test in the terminal
      ttyper # cli typing test
      unzip
      valgrind # c memory analyzer
      wavemon # monitoring for wireless network devices
      wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
      wget
      woomer
      yt-dlp-light
      xdg-utils
      xxd
      python313Packages.psutil

      ## CLI
      cbonsai # terminal screensaver
      cmatrix
      pipes # terminal screensaver
      sl
      tty-clock # cli clock
      kdePackages.plasma-browser-integration
      neovim

      ## GUI Apps
      audacity
      bleachbit # cache cleaner
      filezilla
      gimp
      gnome-disk-utility
      libreoffice
      nix-prefetch-github
      obs-studio
      pavucontrol # pulseaudio volume controle (GUI)
      pitivi # video editing
      gnome-calculator # calculator
      resources # GUI resources monitor
      soundwireserver
      thunderbird
      vlc
      winetricks
      wineWowPackages.wayland
      zenity
      keepassxc
      syncthing
      openrgb-with-all-plugins
      opentabletdriver
      jellyfin-mpv-shim
      qpwgraph
      chatterino7
      streamlink

      # C / C++
      gcc
      gdb
      gnumake

      # Zig
      inputs.zig.packages.${system}.master
      zls

      # Python
      python3
      python312Packages.ipython

      # Node
      nodejs
      deno
      rustup

      inputs.alejandra.defaultPackage.${system}
    ]
  );
}
