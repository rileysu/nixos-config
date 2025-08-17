{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  config = {
    security.pam.services.swaylock = {};
  };
}