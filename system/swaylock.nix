{ config, lib, pkgs, inputConfig, ... }:

{
  config = {
    security.pam.services.swaylock = {};
  };
}