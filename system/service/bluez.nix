{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  config = {
    hardware.bluetooth = {
      enable = true;
    };
  };
}