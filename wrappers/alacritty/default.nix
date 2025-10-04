{ config, lib, pkgs, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = config.metaConfig.theme.name; };

    conf = pkgs.writeText "alacritty.toml" ((import ./conf.nix) { inherit theme config; });
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