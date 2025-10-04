{ config, lib, pkgs, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = config.metaConfig.theme.name; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    conf = pkgs.writeText "config" ((import ./conf.nix) { inherit themeNamed config; });
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