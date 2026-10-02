{ config, pkgs, lib, ... }:
let
  #
  # cage qutebrowser with nice on process priority 19
  # so qtwebengine does not cause stutters while processing
  # some heavy content.
  #
  package = pkgs.qutebrowser.overrideAttrs (o: {
    postInstall = ''
      ${o.postInstall}

      sed -i '48s|Exec=qutebrowser --untrusted-args %u|Exec=nice -n 19 qutebrowser --untrusted-args %u|' \
        "$out/share/applications/org.qutebrowser.qutebrowser.desktop"
    '';
  });

in {
  options = {
    qutebrowser-config = {
      small-screen = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = ''
          Increase font-size and zoom for small screens
        '';
      };

      disable-gbm = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = ''
          Disable force-use GBM for QTWebEngine
        '';
      };
    };
  };

  config = {
    home.packages = [ package ];
    home.sessionVariables = lib.mkMerge [
      (
        lib.mkIf config.qutebrowser-config.disable-gbm {
          QTWEBENGINE_FORCE_USE_GBM = 0;
        }
      )
    ];

    xdg.configFile = {
      "qutebrowser/dracula" = {
        source = pkgs.fetchFromGitHub {
          owner = "dracula";
          repo = "qutebrowser-dracula-theme";
          rev = "791de19";
          hash = "sha256-BXTvYFZnzEDlNEOTaWm4m8MEelVrRsUkNdwYKxaxw/g=";
        };
      };

      "qutebrowser/config.py" = {
        text = ''
          config.load_autoconfig()

          config.set("fonts.default_family", "Iosevka")
          config.set("fonts.default_size", "16pt")

          config.set("content.geolocation", False)
          config.set("content.notifications.enabled", False)
          config.set("content.pdfjs", False)
          config.set("content.dns_prefetch", True)
          config.set("content.tls.certificate_errors", "ask-block-thirdparty")

          config.set("completion.height", "20%")
          config.set("completion.cmd_history_max_items", 2)
          config.set("completion.min_chars", 3)
          config.set("completion.web_history.max_items", 10)

          config.set("downloads.location.prompt", False)
          config.set("downloads.location.directory", "~/downloads/")
          config.set("downloads.remove_finished", 3000)

          config.set("url.searchengines", {
            "DEFAULT": "https://google.ca/search?hl=eng&udm=14&q={}",
            "!d": "https://duckduckgo.com/search?q={}",
          })
          config.set("url.start_pages", "https://google.ca/")

          #
          # too many crashes, is this an work-around?
          #
          config.set("qt.workarounds.disable_accessibility", "always")

          import dracula.draw
          dracula.draw.blood(c, { "spacing": { "vertical": 6, "horizontal": 8 }})
        '' + lib.optionalString config.qutebrowser-config.small-screen ''
          config.set("fonts.default_size", "20pt")
          config.set("zoom.default", "125%")
        '';
      };
    };
  };
}
