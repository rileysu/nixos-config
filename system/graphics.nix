{ config, lib, pkgs, ... }:

{
  config = {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}