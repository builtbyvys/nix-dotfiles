{
  inputs,
  pkgs,
  ...
}: {
  home.packages = (
    with pkgs; [
      # sys & file mgmt.
      dconf-editor
      file # show file information
      gtrash # rm replacement, put deleted files in system trash
      hexdump
      htop
      killall
      libnotify
      man-pages
      mimeo
      ncdu # disk space
      nitch # system fetch util
      openssl
      programmer-calculator
      unzip
      xdg-utils
      xxd
      zenity

      # file ops
      caligula # user-friendly, lightweight TUI for disk imaging
      docfd # TUI multiline fuzzy document finder
      entr # perform action when file change
      eza # ls replacement
      fd # find replacement
      ripgrep # grep replacement

      # text processing & docs
      jq # JSON processor
      tdf # cli pdf viewer
      tldr
      todo # cli todo list
      treefmt # project formatter

      # media/gfx
      ffmpeg
      gifsicle # gif utility
      imv # image viewer
      mpv # video player

      # audio & system ctrl
      pamixer # pulseaudio command line mixer
      playerctl # controller for media players
      poweralertd
      wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)

      # internet tools
      ani-cli
      wavemon # monitoring for wireless network devices
      wget
      woomer
      yt-dlp-light

      # dev tools
      lazygit # Terminal UI for git (referenced in your aliases)
      tig # Text-mode interface for git
      gh-dash # GitHub CLI dashboard for PRs and issues
      git-absorb # Automatically absorb staged changes into appropriate commits
      git-branchless # Experimental tools for Git workflows
      onefetch # fetch utility for git repo
      nixd # nix lsp
      nixfmt-rfc-style # nix formatter
      shfmt # bash formatter
      tokei # Count lines of code by language
      scc # Fast code counter (alternative to tokei)
      valgrind # c memory analyzer
      bitwise # cli tool for bit / hex manipulation
      diff-so-fancy # Better diff output (alternative to delta)
      diffutils # Standard diff tools
      dotnet-sdk
      dotnet-runtime
      ragenix
      neovim
      icu75
      cabextract
      p7zip-rar
      gcc
      gdb
      gnumake
      rustup
      inputs.zig.packages.${system}.master
      zls
      python3
      python312Packages.psutil
      python312Packages.ipython
      nodejs
      deno
      jdk
      inputs.alejandra.defaultPackage.${system}

      # multi-lang tools
      gtt # google translate TUI
      translate-shell # cli translator
      (aspellWithDicts (dicts: with dicts; [en en-computers en-science es]))

      # fun stuff
      cbonsai # terminal screensaver
      cmatrix
      pipes # terminal screensaver
      sl
      tty-clock # cli clock
      toipe # typing test in the terminal
      ttyper # cli typing test
      kdePackages.plasma-browser-integration
      swappy # snapshot editing tool

      # GUI apps
      audacity
      bleachbit # cache cleaner
      filezilla
      gimp
      gnome-disk-utility
      libreoffice
      obs-studio
      pavucontrol # pulseaudio volume controle (GUI)
      pitivi # video editing
      gnome-calculator # calculator
      keepassxc
      syncthing
      opentabletdriver
      jellyfin-mpv-shim
      qpwgraph
      chatterino7
      streamlink
      qbittorrent
      tor-browser
      android-studio
      godot
      winetricks
      wineWowPackages.wayland

      # system tools & utils
      nix-prefetch-github
      nix-ld
      avbroot
      scrcpy
      auto-cpufreq
    ]
  );
}
