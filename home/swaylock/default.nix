{ config, lib, pkgs, inputConfig, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = inputConfig.theme.name; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    conf = (import ./conf.nix) { inherit themeNamed inputConfig; };
  in {
    config = {
      xdg.configFile."swaylock/config" = {
        text = conf;
      };
    };
  }
