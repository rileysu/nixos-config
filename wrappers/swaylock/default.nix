{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };

    conf = pkgs.writeText "config" ((import ./conf.nix) { inherit userSettings systemSettings theme; });
  in {
    config = {
      wrappers.swaylock = {
        basePackage = pkgs.swaylock;

        programs.swaylock = {
          prependFlags = [
            "--config"
            "${conf}"
          ];
        };
      };
    };
  }