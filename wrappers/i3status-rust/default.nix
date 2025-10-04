{ config, lib, pkgs, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = config.metaConfig.theme.name; };

    conf = pkgs.writeText "config.toml" ((import ./conf.nix) { inherit theme config; });
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