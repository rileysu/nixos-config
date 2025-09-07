{ config, lib, pkgs, userSettings, systemSettings, ... }:

let 
  packageModuleUtilities = (import ../../package-modules/utilities.nix);
  desktopEnvUtilities = import ../../desktop-envs/utilities.nix;

  desktopEnvConfig = desktopEnvUtilities.getDesktopEnvConfig { profile = systemSettings.desktopEnvProfile; };

  packageModuleIDs = desktopEnvConfig.packageModuleIDs;

  packageModule = packageModuleUtilities.combinePackageModules { packageModules = packageModuleUtilities.getPackageModules { inherit packageModuleIDs; }; };

  packageModuleModulePaths = packageModuleUtilities.genHomeModulePaths { prefix = ../../home; inherit packageModule; };
in
{
  imports = packageModuleModulePaths ++ [];

  config = {
    home.username = userSettings.username;
    home.homeDirectory = "/home/${userSettings.username}";

    home.stateVersion = "25.11";
  };
}