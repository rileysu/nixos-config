{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  config = {
    programs.fish = {
      enable = true;
      package = null;
    };
  };
}