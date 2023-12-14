{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    profiles.main = {
      isDefault = true;
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        tree-style-tab
        sponsorblock
        dearrow
        return-youtube-dislikes
        violentmonkey
        darkreader
        old-twitter-layout-2022
        socialfixer
        youtube-recommended-videos
        vimium-ff
      ];
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
    };
  };
}
