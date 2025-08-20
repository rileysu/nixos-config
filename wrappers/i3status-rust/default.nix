{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };

    desktopEnvUtilities = import ../../desktop-envs/utilities.nix;
    desktopEnvConfig = desktopEnvUtilities.getDesktopEnvConfig { profile = systemSettings.desktopEnvProfile; };

    conf = pkgs.writeText "config.toml" ((import ./conf.nix) { inherit userSettings systemSettings theme desktopEnvConfig; });
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