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
      search.engines = {
        "Nix Packages" = {
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
          urls = [
            {
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
        };

        "Nix Options" = {
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@no" ];
          urls = [
            {
              template = "https://search.nixos.org/options";
              params = [
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
        };
        "NixOS Wiki" = {
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@nw" ];
          urls = [ { template = "https://wiki.nixos.org/index.php?search={searchTerms}"; } ];
        };
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
