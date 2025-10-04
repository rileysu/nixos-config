{ config, lib, pkgs, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = config.metaConfig.theme.name; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    conf = (import ./conf.nix) { inherit themeNamed config; };

    colorschemeModuleConf = (import ./modules/colorscheme.nix) { inherit themeNamed config; };
    treesitterModuleConf = (import ./modules/treesitter.nix) { inherit themeNamed config; };
    uiModuleConf = (import ./modules/ui.nix) { inherit themeNamed config; };
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

      xdg.configFile."nvim/lua/plugins/treesitter.lua" = {
        text = treesitterModuleConf;
      };

      xdg.configFile."nvim/lua/plugins/ui.lua" = {
        text = uiModuleConf;
      };
    };
  }
