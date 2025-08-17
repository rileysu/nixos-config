{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    conf = pkgs.writeText "config" ((import ./conf.nix) { inherit userSettings systemSettings themeNamed; });
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