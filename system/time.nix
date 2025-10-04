{ config, lib, pkgs, ... }:

{
  config = {
    time.timeZone = config.metaConfig.time.timezone;
  };
}