{ config, lib, pkgs, inputConfig, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = inputConfig.theme.name; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    conf = (import ./conf.nix) { inherit themeNamed inputConfig; };

    colorschemeModuleConf = (import ./modules/colorscheme.nix) { inherit themeNamed inputConfig; };
    uiModuleConf = (import ./modules/ui.nix) { inherit themeNamed inputConfig; };
  in {
    config = {
      xdg.configFile."nvim/init.lua" = {
        text = conf;
      };

      xdg.configFile."nvim/lua/config" = {
        source = ./starter/lua/config;
        recursive = true;
      };

      xdg.configFile."nvim/lua/plugins/colorscheme.lua" = {
        text = colorschemeModuleConf;
      };

      xdg.configFile."nvim/lua/plugins/ui.lua" = {
        text = uiModuleConf;
      };
    };
  }
