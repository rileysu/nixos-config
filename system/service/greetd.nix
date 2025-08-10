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
          command = "${tuigreetPath} --time --cmd ${userSettings.defaultWM}";
          user = "greeter";
        };
      };
    };
  };
}