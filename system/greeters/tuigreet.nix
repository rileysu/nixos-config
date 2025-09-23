{ config, lib, pkgs, inputConfig, ... }:

let
  tuigreetPath = "${pkgs.tuigreet}/bin/tuigreet";

  launchSuffix = if inputConfig.greeter.launchCommand != null then "--cmd ${inputConfig.greeter.launchCommand}" else "";
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
