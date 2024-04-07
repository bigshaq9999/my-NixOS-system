{
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.main = {
      isDefault = true;
      extensions = builtins.attrValues {
        inherit
          (inputs.firefox-addons.packages.${pkgs.system})
          ublock-origin
          tree-style-tab
          sponsorblock
          dearrow
          return-youtube-dislikes
          violentmonkey
          darkreader
          youtube-recommended-videos
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
    };
  };
}
