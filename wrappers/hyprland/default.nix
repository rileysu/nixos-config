{ config, lib, pkgs, inputConfig, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = inputConfig.theme.name; };

    conf = pkgs.writeText "hyprland.conf" ((import ./conf.nix) { inherit theme inputConfig; });
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