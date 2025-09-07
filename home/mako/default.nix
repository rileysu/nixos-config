{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    desktopEnvUtilities = import ../../desktop-envs/utilities.nix;
    desktopEnvConfig = desktopEnvUtilities.getDesktopEnvConfig { profile = systemSettings.desktopEnvProfile; };

    conf = (import ./conf.nix) { inherit userSettings systemSettings themeNamed desktopEnvConfig; };
  in {
    config = {
      xdg.configFile."mako/config" = {
        text = conf;
      };
    };
  }