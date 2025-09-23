{ config, lib, pkgs, inputConfig, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = inputConfig.theme.name; };

    conf = pkgs.writeText "config.toml" ((import ./conf.nix) { inherit theme inputConfig; });
  in {
    config = {
      wrappers.i3status-rust = {
        basePackage = pkgs.i3status-rust;

        programs.i3status-rs = {
          prependFlags = [
            "${conf}"
          ];
        };
      };
    };
  }