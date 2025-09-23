{ config, lib, pkgs, inputConfig, ... }:

{
  config = {
    time.timeZone = inputConfig.time.timezone;
  };
}