{ config, lib, pkgs, inputConfig, ... }:

{
  config = {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}