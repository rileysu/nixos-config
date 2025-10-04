{ config, lib, pkgs, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = config.metaConfig.theme.name; };

    conf = pkgs.writeText "hyprland.conf" ((import ./conf.nix) { inherit theme config; });
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