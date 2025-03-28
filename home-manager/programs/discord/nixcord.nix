_: {
  programs.nixcord = {
    enable = true;
    discord.openASAR.enable = true;
    vesktop.enable = true;
    quickCss = builtins.readFile ./quickCSS.css;
    config = {
      useQuickCss = true;
      plugins = {
        betterGifPicker.enable = true;
        betterNotesBox.enable = true;
        betterSessions.enable = true;
        betterSettings.enable = true;
        betterUploadButton.enable = true;
        biggerStreamPreview.enable = true;
        blurNSFW.enable = true;
        callTimer = {
          enable = true;
          format = "human";
        };
        clearURLs.enable = true;
        colorSighted.enable = true;
        consoleJanitor.enable = true;
        consoleJanitor.disableNoisyLoggers = true;
        crashHandler.enable = true;
        dearrow.enable = true;
        dontRoundMyTimestamps.enable = true;
        disableCallIdle.enable = true;
        favoriteEmojiFirst.enable = true;
        fixCodeblockGap.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendInvites.enable = true;
        friendsSince.enable = true;
        gifPaste.enable = true;
        greetStickerPicker.enable = true;
        hideAttachments.enable = true;
        ignoreActivities = {
          enable = true;
          ignorePlaying = true;
          ignoreListening = true;
          ignoreWatching = true;
          ignoreCompeting = true;
        };
        implicitRelationships.enable = true;
        imageZoom.enable = true;
        memberCount.enable = true;
        messageLatency.enable = true;
        messageLinkEmbeds.enable = true;
        messageLogger = {
          enable = true;
          collapseDeleted = true;
          ignoreSelf = true;
          ignoreBots = true;
        };
        messageTags.enable = true;
        moreUserTags.enable = true;
        mutualGroupDMs.enable = true;
        newGuildSettings.enable = true;
        noBlockedMessages.enable = true;
        noDevtoolsWarning.enable = true;
        noF1.enable = true;
        noMaskedUrlPaste.enable = true;
        noMosaic.enable = true;
        noPendingCount.enable = true;
        noProfileThemes.enable = true;
        noRPC.enable = true;
        noTypingAnimation.enable = true;
        noUnblockToJump.enable = true;
        normalizeMessageLinks.enable = true;
        onePingPerDM.enable = true;
        pauseInvitesForever.enable = true;
        permissionsViewer.enable = true;
        pictureInPicture.enable = true;
        pinDMs.enable = true;
        platformIndicators.enable = true;
        previewMessage.enable = true;
        quickMention.enable = true;
        reactErrorDecoder.enable = true;
        readAllNotificationsButton.enable = true;
        relationshipNotifier.enable = true;
        replyTimestamp.enable = true;
        revealAllSpoilers.enable = true;
        reverseImageSearch.enable = true;
        roleColorEverywhere.enable = true;
        fullSearchContext.enable = true;
        serverInfo.enable = true;
        serverListIndicators.enable = true;
        shikiCodeblocks.enable = true;
        showConnections.enable = true;
        showHiddenThings.enable = true;
        showTimeoutDuration.enable = true;
        showMeYourName.enable = true;
        showMeYourName.mode = "nick-user";
        silentTyping.enable = true;
        startupTimings.enable = true;
        streamerModeOnStream.enable = true;
        summaries.enable = true;
        textReplace.enable = true;
        themeAttributes.enable = true;
        typingIndicator.enable = false;
        typingTweaks.enable = true;
        unindent.enable = true;
        unlockedAvatarZoom.enable = true;
        userVoiceShow.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        vencordToolbox.enable = true;
        viewIcons.enable = true;
        viewRaw.enable = true;
        voiceChatDoubleClick.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
        volumeBooster.enable = true;
        webScreenShareFixes.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
