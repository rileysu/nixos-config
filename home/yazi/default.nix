{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    desktopEnvUtilities = import ../../desktop-envs/utilities.nix;
    desktopEnvConfig = desktopEnvUtilities.getDesktopEnvConfig { profile = systemSettings.desktopEnvProfile; inherit lib pkgs userSettings systemSettings; };

    mainConf = (import ./conf.nix) { inherit userSettings systemSettings themeNamed desktopEnvConfig; };
    keymapConf = (import ./keymap.nix) { inherit userSettings systemSettings themeNamed desktopEnvConfig; };
    themeConf = (import ./theme.nix) { inherit userSettings systemSettings themeNamed desktopEnvConfig; };
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
