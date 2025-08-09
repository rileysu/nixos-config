{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  config = {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}