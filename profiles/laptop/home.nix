{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  imports = [
    ../../user/app/sway.nix
  ];

  config = {
    home.username = userSettings.username;
    home.homeDirectory = "/home/${userSettings.username}";

    home.stateVersion = "25.11";
  };
}