{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    conf = pkgs.writeText "config" ((import ./conf.nix) { inherit userSettings systemSettings themeNamed; });
  in {
    config = {
      wrappers.mako = {
        basePackage = pkgs.mako;

        programs.mako = {
          prependFlags = [
            "--config"
            "${conf}"
          ];
        };
      };
    };
  }