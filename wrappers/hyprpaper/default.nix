{ config, lib, pkgs, inputConfig, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = inputConfig.theme.name; };

    conf = pkgs.writeText "hyprpaper.conf" ((import ./conf.nix) { inherit theme inputConfig; });
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