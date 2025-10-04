{ config, lib, pkgs, ... }:

{
  config = {
    hardware.bluetooth = {
      enable = true;
    };
  };
}