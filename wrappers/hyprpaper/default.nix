{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };

    conf = pkgs.writeText "hyprpaper.conf" ((import ./conf.nix) { inherit userSettings systemSettings theme; });
  in {
    config = {
      wrappers.hyprpaper = {
        basePackage = pkgs.hyprpaper;

        programs.hyprpaper = {
          prependFlags = [
            "--config"
            "${conf}"
          ];
        };
      };
    };
  }