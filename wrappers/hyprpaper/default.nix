{ config, lib, pkgs, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = config.metaConfig.theme.name; };

    conf = pkgs.writeText "hyprpaper.conf" ((import ./conf.nix) { inherit theme config; });
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