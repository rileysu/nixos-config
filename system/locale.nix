{ config, lib, pkgs, ... }:

{
  config = {
    i18n.defaultLocale = config.metaConfig.locale.default;
  };
}