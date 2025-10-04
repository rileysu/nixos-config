{ config, lib, pkgs, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = config.metaConfig.theme.name; };

    conf = pkgs.writeText "hyprlock.conf" ((import ./conf.nix) { inherit theme config; });
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