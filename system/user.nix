{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  config = {
    users.users.${userSettings.username} = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      packages = with pkgs; [];
    };
  };
}