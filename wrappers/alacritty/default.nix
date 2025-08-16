{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };

    conf = pkgs.writeText "alacritty.toml" ((import ./conf.nix) { inherit userSettings systemSettings theme; });
  in {
    config = {
      wrappers.alacritty = {
        basePackage = pkgs.alacritty;

        programs.alacritty = {
          prependFlags = [
            "--config-file"
            "${conf}"
          ];
        };
      };
    };
  }