{ config, lib, pkgs, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = config.metaConfig.theme.name; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    mainConf = (import ./conf.nix) { inherit themeNamed config; };
    keymapConf = (import ./keymap.nix) { inherit themeNamed config; };
    themeConf = (import ./theme.nix) { inherit themeNamed config; };
  in {
    config = {
      xdg.configFile."yazi/yazi.toml" = {
        text = mainConf;
      };
      
      xdg.configFile."yazi/keymap.toml" = {
        text = keymapConf;
      };

      xdg.configFile."yazi/theme.toml" = {
        text = themeConf;
      };
    };
  }
