{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };

    conf = pkgs.writeText "config.toml" ((import ./conf.nix) { inherit userSettings systemSettings theme; });
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