{
  config,
  inputs,
  lib,
  ...
}:
{
  programs.nixcord = {
    enable = true;

    quickCss =
      let
        catppuccinTheme = builtins.readFile "${inputs.catppuccin}/catppuccin-mocha.theme.css";
      in
      ''
        ${catppuccinTheme}

        /* additional css snippets go here */
        .container-1eFtFS {
          background-color: rgba(0, 0, 0, 0.6);
        }
      '';

    config = {
      useQuickCss = true;

      frameless = true;

      plugins = {
        hideAttachments.enable = true;
        betterRoleDot.enable = true;
        noDevtoolsWarning.enable = true;
        notifications.enable = true;

        ignoreActivities = {
          enable = true;
          ignorePlaying = true;
          ignoreWatching = true;
          ignoredActivities = [
            "Spotify"
            "Visual Studio Code"
          ];
        };

        readAllNotificationsButton.enable = true;
        betterFolders.enable = true;
        favoriteMessages.enable = true;
        viewRaw.enable = true;
      };
    };

    extraConfig = {
      notifyAboutUpdates = true;
      autoUpdate = true;
      autoUpdateNotification = true;
      useQuickCss = true;
      themeLinks = [ ];
      enabledThemes = [ ];
      enableReactDevtools = false;
    };
  };

  # remove Discord from packages if it was there
  home.packages = lib.mkIf (config.programs.nixcord.enable) (
    lib.filter (p: p.pname != "discord") config.home.packages
  );
}
