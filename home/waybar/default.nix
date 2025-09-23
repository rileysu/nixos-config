# https://github.com/goecho/goecho-waybar/tree/main/waybar
{ config, lib, pkgs, inputConfig, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = inputConfig.theme.name; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    conf = (import ./conf.nix) { inherit themeNamed inputConfig; };
    style = (import ./style.nix) { inherit themeNamed inputConfig; };
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
