{ flatpak, ... }: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  
  home-manager.users."user" = { config, ... }: {
    imports = [
      flatpak.homeManagerModules.declarative-flatpak
    ];

    services.flatpak = {
      packages = [
        "flathub:app/com.usebottles.bottles//stable"
      ];
      remotes = {
        "flathub" = "https://flathub.org/repo/flathub.flatpakrepo";
        "flathub-beta" = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
      };
      # flatpak-dir = "${config.home.homeDirectory}/flatpak";
      # debug = true;
      onCalendar = "hourly";
      runOnActivation = true;
    };

    # home.file.".zshrc".text = "";

    # home.stateVersion = "22.11";
  };
}
