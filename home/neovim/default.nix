{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    desktopEnvUtilities = import ../../desktop-envs/utilities.nix;
    desktopEnvConfig = desktopEnvUtilities.getDesktopEnvConfig { profile = systemSettings.desktopEnvProfile; inherit lib pkgs userSettings systemSettings; };

    conf = (import ./conf.nix) { inherit userSettings systemSettings themeNamed desktopEnvConfig; };

    colorschemeModuleConf = (import ./modules/colorscheme.nix) { inherit userSettings systemSettings themeNamed desktopEnvConfig; };
    uiModuleConf = (import ./modules/ui.nix) { inherit userSettings systemSettings themeNamed desktopEnvConfig; };
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
