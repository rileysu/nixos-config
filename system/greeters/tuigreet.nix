{ config, lib, pkgs, userSettings, systemSettings, ... }:

let
  tuigreetPath = "${pkgs.tuigreet}/bin/tuigreet";

  desktopEnvUtilities = import ../../desktop-envs/utilities.nix;
  desktopEnvConfig = desktopEnvUtilities.getDesktopEnvConfig { profile = systemSettings.desktopEnvProfile; };
  launchSuffix = if desktopEnvConfig.launchCommand != null then "--cmd ${desktopEnvConfig.launchCommand}" else "";
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