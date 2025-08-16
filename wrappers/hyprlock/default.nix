{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };

    conf = pkgs.writeText "hyprlock.conf" ((import ./conf.nix) { inherit userSettings systemSettings theme; });
  in {
    config = {
      wrappers.hyprlock = {
        basePackage = pkgs.hyprlock;

        programs.hyprlock = {
          prependFlags = [
            "--config"
            "${conf}"
          ];
        };
      };
    };
  }