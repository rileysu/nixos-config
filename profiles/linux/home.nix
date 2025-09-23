{ config, lib, pkgs, inputConfig, ... }:

let 
  packageModuleUtilities = (import ../../package-modules/utilities.nix);

  packageModuleIDs = inputConfig.packageModuleIDs;

  packageModule = packageModuleUtilities.combinePackageModules { packageModules = packageModuleUtilities.getPackageModules { inherit packageModuleIDs; }; };

  packageModuleModulePaths = packageModuleUtilities.genHomeModulePaths { prefix = ../../home; inherit packageModule; };
in
{
  imports = packageModuleModulePaths ++ [];

  config = {
    home.username = inputConfig.user.username;
    home.homeDirectory = "/home/${inputConfig.user.username}";

    home.stateVersion = "25.11";
  };
}
