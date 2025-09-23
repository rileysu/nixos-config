{ config, lib, pkgs, inputConfig, ... }:

{
  config = {
    hardware.bluetooth = {
      enable = true;
    };
  };
}