{ config, lib, pkgs, inputConfig, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = inputConfig.theme.name; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    mainConf = (import ./conf.nix) { inherit themeNamed inputConfig; };
    keymapConf = (import ./keymap.nix) { inherit themeNamed inputConfig; };
    themeConf = (import ./theme.nix) { inherit themeNamed inputConfig; };
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
