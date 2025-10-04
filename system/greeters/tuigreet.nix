{ config, lib, pkgs, ... }:

let
  tuigreetPath = "${pkgs.tuigreet}/bin/tuigreet";

  launchSuffix = if config.metaConfig.greeter.launchCommand != null then "--cmd ${config.metaConfig.greeter.launchCommand}" else "";
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
