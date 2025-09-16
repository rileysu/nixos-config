# https://github.com/goecho/goecho-waybar/tree/main/waybar
{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    desktopEnvUtilities = import ../../desktop-envs/utilities.nix;
    desktopEnvConfig = desktopEnvUtilities.getDesktopEnvConfig { profile = systemSettings.desktopEnvProfile; inherit lib pkgs userSettings systemSettings; };

    conf = (import ./conf.nix) { inherit userSettings systemSettings themeNamed desktopEnvConfig; };
    style = (import ./style.nix) { inherit userSettings systemSettings themeNamed desktopEnvConfig; };
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
