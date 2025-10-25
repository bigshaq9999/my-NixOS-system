{ pkgs, ... }:
{
  programs.floorp = {
    enable = false;
    package = pkgs.floorp-bin;
    profiles.main = {
      isDefault = true;
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # userChrome.css
      };

      extensions = builtins.attrValues {
        inherit (pkgs.nur.repos.rycee.firefox-addons)
          ublock-origin
          sponsorblock
          dearrow
          return-youtube-dislikes
          violentmonkey
          darkreader
          vimium-c
          ;
      };

      # userChrome = builtins.readFile ./userChrome.css;
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
