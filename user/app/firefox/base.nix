{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  config = {
    programs.firefox = {
      enable = true;
      package = null; # Since we are using a flatpak

      profiles.default = {
        id = 0;
        isDefault = true;

        settings = {
          # No warnings please!
          "browser.aboutConfig.showWarning" = false;

          # Startup / Newtab
          "browser.startup.page" = 0;
          "browser.startup.homepage" = "about:blank";
          "browser.newtabpage.enabled" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.default.sites" = "";

          # Disable geolocation services
          "geo.provider.ms-windows-location" = false;
          "geo.provider.use_corelocation" = false;
          "geo.provider.use_geoclue" = false;

          # Remove ads and recommendations
          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          "browser.discovery.enabled" = false;
          "browser.shopping.experience2023.enabled" = false;

          # Disable telemetry and data collection
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "app.shield.optoutstudies.enabled" = false;
          "app.normandy.enabled" = false;
          "app.normandy.api_url" = "";
          "breakpad.reportURL" = "";
          "browser.tabs.crashReporting.sendReport" = false;
          "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
          "captivedetect.canonicalURL" = "";
          "network.captive-portal-service.enabled" = false;
          "network.connectivity-service.enabled" = false;

          # Privacy-focused network settings
          "network.prefetch-next" = false;
          "network.dns.disablePrefetch" = true;
          "network.dns.disablePrefetchFromHTTPS" = true;
          "network.predictor.enabled" = false;
          "network.predictor.enable-prefetch" = false;
          "network.http.speculative-parallel-limit" = 0;
          "browser.places.speculativeConnect.enabled" = false;
          "network.proxy.socks_remote_dns" = true;
          "network.file.disable_unc_paths" = true;
          "network.gio.supported-protocols" = "";
          "browser.urlbar.speculativeConnect.enabled" = false;
          "browser.urlbar.quicksuggest.enabled" = false;
          "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;
          "browser.search.suggest.enabled" = false;
          "browser.urlbar.suggest.searches" = false;
          "browser.urlbar.trending.featureGate" = false;
          "browser.urlbar.addons.featureGate" = false;
          "browser.urlbar.fakespot.featureGate" = false;
          "browser.urlbar.mdn.featureGate" = false;
          "browser.urlbar.pocket.featureGate" = false;
          "browser.urlbar.weather.featureGate" = false;
          "browser.urlbar.yelp.featureGate" = false;
          "browser.formfill.enable" = false;
          "browser.search.separatePrivateDefault" = true;
          "browser.search.separatePrivateDefault.ui.enabled" = true;
          "signon.autofillForms" = false;
          "signon.formlessCapture.enabled" = false;
          "network.auth.subresource-http-auth-allow" = 1;
          "browser.cache.disk.enable" = false;
          "browser.privatebrowsing.forceMediaMemoryCache" = true;
          "media.memory_cache_max_size" = 65536;
          "browser.sessionstore.privacy_level" = 2;
          "toolkit.winRegisterApplicationRestart" = false;
          "browser.shell.shortcutFavicons" = false;
          
          # Security hardening
          "security.ssl.require_safe_negotiation" = true;
          "security.tls.enable_0rtt_data" = false;
          "security.OCSP.enabled" = 1;
          "security.OCSP.require" = true;
          "security.cert_pinning.enforcement_level" = 2;
          "security.remote_settings.crlite_filters.enabled" = true;
          "security.pki.crlite_mode" = 2;
          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_send_http_background_request" = false;
          "security.ssl.treat_unsafe_negotiation_as_broken" = true;
          "browser.xul.error_pages.expert_bad_cert" = true;
          "network.http.referer.XOriginTrimmingPolicy" = 2;
          "privacy.userContext.enabled" = true;
          "privacy.userContext.ui.enabled" = true;
          "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
          "media.peerconnection.ice.default_address_only" = true;
          "dom.disable_window_move_resize" = true;
          
          # Download and file handling
          "browser.download.start_downloads_in_tmp_dir" = true;
          "browser.helperApps.deleteTempFileOnExit" = true;
          "browser.uitour.enabled" = false;
          "devtools.debugger.remote-enabled" = false;
          "permissions.manager.defaultsUrl" = "";
          "network.IDN_show_punycode" = true;
          
          # PDF and content handling
          "pdfjs.disabled" = false;
          "pdfjs.enableScripting" = false;
          "browser.tabs.searchclipboardfor.middleclick" = false;
          "browser.contentanalysis.enabled" = false;
          "browser.contentanalysis.default_result" = 0;
          
          # Download behavior
          "browser.download.useDownloadDir" = false;
          "browser.download.alwaysOpenPanel" = false;
          "browser.download.manager.addToRecentDocs" = false;
          "browser.download.always_ask_before_handling_new_types" = true;
          
          # Extension management
          "extensions.enabledScopes" = 5;
          "extensions.postDownloadThirdPartyPrompt" = false;
          
          # Content blocking and cleanup
          "browser.contentblocking.category" = "strict";
          "privacy.sanitize.sanitizeOnShutdown" = true;
          "privacy.clearOnShutdown_v2.cache" = true;
          "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = true;
          "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = true;
          "privacy.clearOnShutdown_v2.downloads" = true;
          "privacy.clearOnShutdown_v2.formdata" = true;
          "privacy.clearOnShutdown_v2.cookiesAndStorage" = true;
          "privacy.clearSiteData.cache" = true;
          "privacy.clearSiteData.cookiesAndStorage" = false;
          "privacy.clearSiteData.historyFormDataAndDownloads" = true;
          "privacy.clearSiteData.browsingHistoryAndDownloads" = true;
          "privacy.clearSiteData.formdata" = true;
          "privacy.sanitize.timeSpan" = 0;
          "privacy.clearHistory.cache" = true;
          "privacy.clearHistory.cookiesAndStorage" = false;
          "privacy.clearHistory.historyFormDataAndDownloads" = true;
          "privacy.clearHistory.browsingHistoryAndDownloads" = true;
          "privacy.clearHistory.formdata" = true;
          
          # Disable all telemetry
          "datareporting.policy.dataSubmissionEnabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.server" = "data:,";
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.coverage.opt-out" = true;
          "toolkit.coverage.opt-out" = true;
          "toolkit.coverage.endpoint.base" = "";
          "browser.startup.homepage_override.mstone" = "ignore";
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
          "browser.urlbar.showSearchTerms.enabled" = false;

          # Custom additions
          "privacy.resistFingerprinting.letterboxing" = false;
          "javascript.options.wasm" = true;
          "webgl.disabled" = false;
        };
      };
    };

    xdg.mimeApps.defaultApplications = {
      "text/html" = [ "firefox.desktop" ];
      "text/xml" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
    };
  };
}