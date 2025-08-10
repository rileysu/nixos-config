{ config, lib, pkgs, userSettings, systemSettings, ... }:

let
  tuigreetPath = "${pkgs.tuigreet}/bin/tuigreet";
in
{
  config = {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${tuigreetPath} --time --command ${userSettings.defaultWM}";
          user = "greeter";
        };
      };
    };
  };
}