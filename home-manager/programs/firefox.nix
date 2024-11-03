{ pkgs, inputs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin;
    profiles.main = {
      isDefault = true;
      settings = {
        "widget.use-xdg-desktop-portal.file-picker" = 1; # KDE file picker
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # userChrome.css
      };

      extensions = builtins.attrValues {
        inherit (pkgs.nur.repos.rycee.firefox-addons)
          ublock-origin
          tree-style-tab
          sponsorblock
          dearrow
          return-youtube-dislikes
          violentmonkey
          darkreader
          vimium-c
          ;
      };

      userChrome = builtins.readFile ./userChrome.css;
    };

    profiles.work = {
      id = 1;
      settings = {
        "widget.use-xdg-desktop-portal.file-picker" = 1; # KDE file picker
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # userChrome.css
      };

      extensions = builtins.attrValues {
        inherit (pkgs.nur.repos.rycee.firefox-addons)
          ublock-origin
          tree-style-tab
          sponsorblock
          return-youtube-dislikes
          vimium-c
          ;
      };

      userChrome = builtins.readFile ./userChrome.css;
    };

    policies = {
      DisableTelemetry = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
      NoDefaultBookmarks = true;
      DisableFirefoxAccounts = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisableMasterPasswordCreation = true;
      DisablePocket = true;
      DisableSetDesktopBackground = true;
      DefaultDownloadDirectory = "\${home}/Downloads";
      PromptForDownloadLocation = true;
    };
  };
}
