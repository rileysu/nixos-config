{ config, lib, pkgs, ... }:

{
  config = {
    security.pam.services.swaylock = {};
  };
}