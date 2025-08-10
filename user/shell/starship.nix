{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  config = {
    programs.starship = {
      enable = true;

      enableFishIntegration = true;
    };
  };
}