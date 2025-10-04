{ config, lib, pkgs, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = config.metaConfig.theme.name; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    conf = (import ./conf.nix) { inherit theme config; };
  in {
    config = {
      xdg.configFile."alacritty/alacritty.toml" = {
        text = conf;
      };
    };
  }
