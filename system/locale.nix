{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  config = {
    i18n.defaultLocale = systemSettings.defaultLocale;
  };
}