{ ... }:
{
  programs.nixcord = {
    enable = true;
    discord = {
      vencord = {
        enable = true;
        unstable = true;
      };
      openASAR.enable = true;
    };

    quickCss = ''
      /* additional css snippets go here */
      .container-1eFtFS {
        background-color: rgba(0, 0, 0, 0.6);
      }
    '';

    config = {
      useQuickCss = true;
      frameless = true;
      enableReactDevtools = true;
      plugins = {
        hideAttachments.enable = true;
        betterRoleContext.enable = true;
        betterRoleDot.enable = true;
        noDevtoolsWarning.enable = true;
        betterFolders.enable = true;
        viewRaw.enable = true;
      };
    };

    extraConfig = {
      notifyAboutUpdates = true;
      autoUpdate = true;
      autoUpdateNotification = true;
      themeLinks = [ ];
      enabledThemes = [ ];
      enableReactDevtools = false;
    };
  };
}
