{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    desktopEnvUtilities = import ../../desktop-envs/utilities.nix;
    desktopEnvConfig = desktopEnvUtilities.getDesktopEnvConfig { profile = systemSettings.desktopEnvProfile; };

    conf = pkgs.writeText "config" ((import ./conf.nix) { inherit userSettings systemSettings themeNamed desktopEnvConfig; });
  in {
    config = {
      wrappers.sway = {
        basePackage = pkgs.sway;

        programs.sway = {
          prependFlags = [
            "--config"
            "${conf}"
          ];
        };
      };
    };
  }