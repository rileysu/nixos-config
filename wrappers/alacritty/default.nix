{ config, lib, pkgs, inputConfig, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = inputConfig.theme.name; };

    conf = pkgs.writeText "alacritty.toml" ((import ./conf.nix) { inherit theme inputConfig; });
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