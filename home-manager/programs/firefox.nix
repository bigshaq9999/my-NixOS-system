{ pkgs, inputs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin;
    profiles.main = {
      isDefault = true;
      settings = {
        "widget.use-xdg-desktop-portal.file-picker" = 1; # KDE file picker
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
          vimium-ff
          ;
      };

    };

    profiles.work = {
      id = 1;
      settings = {
        "widget.use-xdg-desktop-portal.file-picker" = 1; # KDE file picker
      };

      extensions = builtins.attrValues {
        inherit (pkgs.nur.repos.rycee.firefox-addons)
          ublock-origin
          tree-style-tab
          sponsorblock
          return-youtube-dislikes
          vimium-ff
          ;
      };

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
