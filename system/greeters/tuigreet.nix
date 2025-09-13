{ config, lib, pkgs, userSettings, systemSettings, ... }:

let
  tuigreetPath = "${pkgs.tuigreet}/bin/tuigreet";

  desktopEnvUtilities = import ../../desktop-envs/utilities.nix;
  desktopEnvConfig = desktopEnvUtilities.getDesktopEnvConfig { profile = systemSettings.desktopEnvProfile; inherit lib pkgs userSettings systemSettings; };
  launchSuffix = if desktopEnvConfig.greeter.launchCommand != null then "--cmd ${desktopEnvConfig.greeter.launchCommand}" else "";
in
{
  config = {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${tuigreetPath} --time ${launchSuffix}";
          user = "greeter";
        };
      };
    };
  };
}
