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
        accountPanelServerProfile.enable = true;
        alwaysExpandRoles.enable = true;
        alwaysTrust = {
          enable = true;
          domain = false;
          file = true;
        };
        anonymiseFileNames = {
          enable = true;
          anonymiseByDefault = false;
          method = "consistent";
        };
        betterFolders = {
          enable = true;
          sidebar = false;
          closeAllFolders = true;
          closeAllHomeButton = false;
          closeOthers = true;
          forceOpen = true;
        };
        betterGifAltText.enable = true;
        betterRoleDot.enable = true;
        betterSessions = {
          enable = true;
          backgroundCheck = true;
        };
        betterSettings.enable = true;
        betterUploadButton.enable = true;
        biggerStreamPreview.enable = true;
        blurNSFW.enable = true;
        callTimer.enable = true;
        clearURLs.enable = true;
        consoleJanitor.enable = true;
        consoleShortcuts.enable = true;
        copyEmojiMarkdown.enable = true;
        copyFileContents.enable = true;
        copyUserURLs.enable = true;
        customIdle = {
          enable = true;
          idleTimeout = 5.0;
          remainInIdle = false;
        };
        decor.enable = true;
        disableCallIdle.enable = true;
        dontRoundMyTimestamps.enable = true;
        emoteCloner.enable = true;
        experiments = {
          enable = true;
          toolbarDevMenu = true;
        };
        f8Break.enable = true;
        fakeNitro.enable = true;
        fakeProfileThemes.enable = true;
        favoriteEmojiFirst.enable = true;
        favoriteGifSearch.enable = true;
        fixCodeblockGap.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        fullUserInChatbox.enable = true;
        gameActivityToggle.enable = true;
        greetStickerPicker = {
          enable = true;
          # sometimes i just want to spam the greet button
          greetMode = "Message";
        };
        hideAttachments.enable = true;
        iLoveSpam.enable = true;
        imageZoom.enable = true;
        implicitRelationships.enable = true;
        invisibleChat.enable = true;
        loadingQuotes.enable = true;
        memberCount.enable = true;
        mentionAvatars.enable = true;
        messageClickActions.enable = true;
        messageLinkEmbeds.enable = true;
        messageLogger.enable = true;
        moreUserTags.enable = true;
        mutualGroupDMs.enable = true;
        newGuildSettings.enable = true;
        noDevtoolsWarning.enable = true;
        noF1.enable = true;
        noMaskedUrlPaste.enable = true;
        noOnboardingDelay.enable = true;
        noPendingCount = {
          enable = true;
          hideFriendRequestsCount = false;
        };
        noTypingAnimation.enable = true;
        noUnblockToJump.enable = true;
        normalizeMessageLinks.enable = true;
        openInApp.enable = true;
        pauseInvitesForever.enable = true;
        permissionFreeWill.enable = true;
        permissionsViewer.enable = true;
        pinDMs.enable = true;
        platformIndicators.enable = true;
        userMessagesPronouns.enable = true;
        quickMention.enable = true;
        quickReply.enable = true;
        reactErrorDecoder.enable = true;
        relationshipNotifier.enable = true;
        replaceGoogleSearch = {
          enable = true;
          customEngineName = "SearXNG";
          customEngineURL = "https://priv.au";
        };
        reverseImageSearch.enable = true;
        reviewDB.enable = true;
        roleColorEverywhere.enable = true;
        summaries.enable = true;
        sendTimestamps.enable = true;
        serverInfo.enable = true;
        serverListIndicators.enable = true;
        shikiCodeblocks.enable = true;
        showAllMessageButtons.enable = true;
        showConnections.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        showMeYourName = {
          enable = true;
          mode = "nick-user";
        };
        showTimeoutDuration.enable = true;
        silentTyping = {
          enable = true;
          showIcon = true;
          isEnabled = false;
        };
        sortFriendRequests = {
          enable = true;
          showDates = true;
        };
        spotifyControls = {
          enable = true;
          hoverControls = true;
          useSpotifyUris = true;
        };
        spotifyCrack.enable = true;
        spotifyShareCommands.enable = true;
        themeAttributes.enable = true;
        translate.enable = true;
        typingIndicator = {
          enable = true;
          includeMutedChannels = false;
          includeBlockedUsers = false;
        };
        typingTweaks.enable = true;
        unlockedAvatarZoom.enable = true;
        unsuppressEmbeds.enable = true;
        userVoiceShow.enable = true;
        USRBG.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        vcNarrator.enable = true;
        vencordToolbox.enable = true;
        viewIcons.enable = true;
        viewRaw.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
        volumeBooster.enable = true;
        whoReacted.enable = true;
        youtubeAdblock.enable = true;
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
