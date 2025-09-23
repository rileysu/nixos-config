{ config, lib, pkgs, inputConfig, ... }:

{
  config = {
    i18n.defaultLocale = inputConfig.locale.default;
  };
}