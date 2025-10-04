{ config, lib, pkgs, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = config.metaConfig.theme.name; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    conf = (import ./conf.nix) { inherit themeNamed config; };
  in {
    config = {
      xdg.configFile."i3status-rust/config.toml" = {
        text = conf;
      };
    };
  }
