{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };

    conf = pkgs.writeText "config" ((import ./conf.nix) { inherit userSettings systemSettings theme; });
  in {
    config = {
      wrappers.tuigreet = {
        basePackage = pkgs.tuigreet;

        programs.tuigreet = {
          prependFlags = [
            "--theme"
            "${conf}"
          ];
        };
      };
    };
  }