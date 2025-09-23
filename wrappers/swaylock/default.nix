{ config, lib, pkgs, inputConfig, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = inputConfig.theme.name; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    conf = pkgs.writeText "config" ((import ./conf.nix) { inherit themeNamed inputConfig; });
  in {
    config = {
      wrappers.swaylock = {
        basePackage = pkgs.swaylock;

        programs.swaylock = {
          prependFlags = [
            "--config"
            "${conf}"
          ];
        };
      };
    };
  }