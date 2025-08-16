{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };

    conf = pkgs.writeText "hyprland.conf" ((import ./conf.nix) { inherit userSettings systemSettings theme; });
  in {
    config = {
      wrappers.hyprland = {
        basePackage = pkgs.hyprland;

        programs.hyprland = {
          prependFlags = [
            "--config"
            "${conf}"
          ];
        };
      };
    };
  }