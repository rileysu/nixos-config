{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  config = {
    time.timeZone = systemSettings.timezone;
  };
}