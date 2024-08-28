{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {

  options.firefox.enable = lib.mkEnableOption "Firefox";
  config = lib.mkIf config.firefox.enable {
    programs.firefox = {
      enable = true;
      # policies = {
      #   "NetworkPrediction" = false;
      #   "CaptivePortal" = false;
      #   "DNSOverHTTPS" = {
      #     "Enabled" = false;
      #   };
      #   "DisabledFirefoxStudies" = true;
      #   "DisableTelemetry" = true;
      #   "DisablePocket" = true;
      # };
      profiles = {
        michaell = {
          id = 0;
          name = "michaell";
          isDefault = true;
          userChrome =
            if config.pywal.enable
            then builtins.readFile ./userChrome-pywal.css
            else builtins.readFile ./userChrome.css;
          settings = {
            "browser.startup.homepage" = "https://search.brave.com";
            "browser.search.defaultenginename" = "Brave";
            "browser.search.order.1" = "Brave";

            # FFProfile generated
            "app.normandy.api_url" = "";
            "app.normandy.enabled" = false;
            "app.shield.optoutstudies.enabled" = false;
            "app.update.auto" = false;
            "beacon.enabled" = false;
            "breakpad.reportURL" = "";
            "browser.aboutConfig.showWarning" = false;
            "browser.cache.offline.enable" = false;
            "browser.crashReports.unsubmittedCheck.autoSubmit" = false;
            "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
            "browser.crashReports.unsubmittedCheck.enabled" = false;
            "browser.disableResetPrompt" = true;
            "browser.fixup.alternate.enabled" = false;
            "browser.newtab.preload" = false;
            "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
            "browser.newtabpage.enabled" = false;
            "browser.newtabpage.enhanced" = false;
            "browser.newtabpage.introShown" = true;
            "browser.safebrowsing.appRepURL" = "";
            "browser.safebrowsing.blockedURIs.enabled" = false;
            "browser.safebrowsing.downloads.enabled" = false;
            "browser.safebrowsing.downloads.remote.enabled" = false;
            "browser.safebrowsing.downloads.remote.url" = "";
            "browser.safebrowsing.enabled" = false;
            "browser.safebrowsing.malware.enabled" = false;
            "browser.safebrowsing.phishing.enabled" = false;
            "browser.search.suggest.enabled" = false;
            "browser.selfsupport.url" = "";
            "browser.send_pings" = false;
            "browser.sessionstore.privacy_level" = 0;
            "browser.shell.checkDefaultBrowser" = false;
            "browser.startup.homepage_override.mstone" = "ignore";
            "browser.tabs.crashReporting.sendReport" = false;
            "browser.urlbar.groupLabels.enabled" = false;
            "browser.urlbar.quicksuggest.enabled" = false;
            "browser.urlbar.speculativeConnect.enabled" = false;
            "browser.urlbar.trimURLs" = false;
            "datareporting.healthreport.service.enabled" = false;
            "datareporting.healthreport.uploadEnabled" = false;
            "datareporting.policy.dataSubmissionEnabled" = false;
            "device.sensors.ambientLight.enabled" = false;
            "device.sensors.enabled" = false;
            "device.sensors.motion.enabled" = false;
            "device.sensors.orientation.enabled" = false;
            "device.sensors.proximity.enabled" = false;
            "dom.battery.enabled" = false;
            "dom.event.clipboardevents.enabled" = false;
            "dom.security.https_only_mode" = true;
            "dom.security.https_only_mode_ever_enabled" = true;
            "experiments.activeExperiment" = false;
            "experiments.enabled" = false;
            "experiments.manifest.uri" = "";
            "experiments.supported" = false;
            "extensions.autoDisableScopes" = 0;
            "extensions.getAddons.cache.enabled" = false;
            "extensions.getAddons.showPane" = false;
            "extensions.pocket.enabled" = false;
            "extensions.shield-recipe-client.api_url" = "";
            "extensions.shield-recipe-client.enabled" = false;
            "extensions.webservice.discoverURL" = "";
            "keyword.enabled" = false;
            # Fix big fonts in 1080p screen
            "layout.css.devPixelsPerPx" = 0.98;
            "media.autoplay.default" = 1;
            "media.autoplay.enabled" = false;
            "media.eme.enabled" = false; # DRM
            "media.gmp-widevinecdm.enabled" = false;
            "media.navigator.enabled" = false;
            "media.peerconnection.enabled" = false;
            "media.video_stats.enabled" = false;
            "network.IDN_show_punycode" = true;
            "network.allow-experiments" = false;
            "network.captive-portal-service.enabled" = false;
            "network.cookie.cookieBehavior" = 1;
            "network.dns.disablePrefetch" = true;
            "network.dns.disablePrefetchFromHTTPS" = true;
            "network.http.referer.spoofSource" = true;
            "network.http.speculative-parallel-limit" = 0;
            "network.predictor.enable-prefetch" = false;
            "network.predictor.enabled" = false;
            "network.prefetch-next" = false;
            "network.trr.mode" = 5;
            "pdfjs.enableScripting" = false;
            "privacy.donottrackheader.enabled" = true;
            "privacy.donottrackheader.value" = 1;
            "privacy.query_stripping" = true;
            "privacy.trackingprotection.cryptomining.enabled" = true;
            "privacy.trackingprotection.enabled" = true;
            "privacy.trackingprotection.fingerprinting.enabled" = true;
            "privacy.trackingprotection.pbmode.enabled" = true;
            "privacy.usercontext.about_newtab_segregation.enabled" = true;
            "security.ssl.disable_session_identifiers" = true;
            "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSite" = false;
            "signon.autofillForms" = false;
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.cachedClientID" = "";
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.hybridContent.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.prompted" = 2;
            "toolkit.telemetry.rejected" = true;
            "toolkit.telemetry.reportingpolicy.firstRun" = false;
            "toolkit.telemetry.server" = "";
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.unifiedIsOptIn" = false;
            "toolkit.telemetry.updatePing.enabled" = false;
            "webgl.disabled" = true;
            "webgl.renderer-string-override" = " ";
            "webgl.vendor-string-override" = " ";
            "widget.use-xdg-desktop-portal.file-picker" = 2;
          };
          search = {
            force = true;
            default = "Brave";
            order = ["Brave" "Metager" "Google"];
            engines = {
              "Nix Packages" = {
                urls = [
                  {
                    template = "https://search.nixos.org/packages";
                    params = [
                      {
                        name = "type";
                        value = "packages";
                      }
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = ["@np"];
              };
              "NixOS Wiki" = {
                urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = ["@nw"];
              };
              "Brave" = {
                urls = [
                  {
                    template = "https://search.brave.com/search";
                    params = [
                      {
                        name = "q";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                iconUpdateURL = "https://upload.wikimedia.org/wikipedia/commons/1/14/Brave_Browser_logotype.svg";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = ["@br"];
              };
              "Metager" = {
                urls = [
                  {
                    template = "https://metager.org/meta/meta.ger3";
                    params = [
                      {
                        name = "eingabe";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                iconUpdateURL = "https://gitlab.metager.de/open-source/MetaGer/-/raw/9021ad4c977e60a304b9305790e356d7ce2be3fa/metager/public/favicon.ico";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = ["@me"];
              };
              "Home-Manager Options" = {
                urls = [
                  {
                    template = "https://home-manager-options.extranix.com/";
                    params = [
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                iconUpdateURL = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = ["@hm"];
              };
              "Bing".metaData.hidden = true;
              "Google".metaData.alias = "@g";
            };
          };
          extensions = let
            nurNoPkgs = import inputs.nur {
              inherit pkgs;
              nurpkgs = import inputs.nixpkgs {system = "x86_64-linux";};
            };
          in
            with nurNoPkgs.repos.rycee.firefox-addons; [
              ublock-origin
              sponsorblock
              bitwarden
              darkreader
              vimium
              localcdn
              keepassxc-browser
              pywalfox
              yomitan
              foxyproxy-standard
           ];
        };
      };
    };
    home = {
      sessionVariables = {
        BROWSER = "firefox";
        MOZ_DISABLE_CONTENT_SANDBOX = 1;
      };
    };
  };

  imports = [
    ./policies.nix
  ];
}
