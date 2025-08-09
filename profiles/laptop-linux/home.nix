{ config, lib, pkgs, userSettings, systemSettings, ... }:

let 
  packageSet = (import ../../package-set/desktop-linux.nix);
  packageSetUtilities = (import ../../package-set/utilities.nix);

  packageSetModulePaths = packageSetUtilities.genHomeModulePaths { prefix = ../../user; inherit packageSet; };
in
{
  imports = packageSetModulePaths ++ [];

  config = {
    home.username = userSettings.username;
    home.homeDirectory = "/home/${userSettings.username}";

    home.stateVersion = "25.11";
  };
}