{ config, lib, pkgs, inputConfig, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = inputConfig.theme.name; };

    conf = pkgs.writeText "hyprlock.conf" ((import ./conf.nix) { inherit theme inputConfig; });
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