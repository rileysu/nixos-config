# https://github.com/goecho/goecho-waybar/tree/main/waybar
{ config, lib, pkgs, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = config.metaConfig.theme.name; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    conf = (import ./conf.nix) { inherit themeNamed config; };
    style = (import ./style.nix) { inherit themeNamed config; };
  in {
    config = {
      xdg.configFile."waybar/config" = {
        text = conf;
      };

      xdg.configFile."waybar/style.css" = {
        text = style;
      };
    };
  }
