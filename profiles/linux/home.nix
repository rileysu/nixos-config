{ config, lib, pkgs, metaConfigProfile, ... }:

let 
  metaConfigUtilities = (import ../../meta-configs/utilities.nix);
  metaConfigOptions = metaConfigUtilities.getOptions { inherit lib; };
  metaConfig = metaConfigUtilities.importProfile { profile = metaConfigProfile; };

  packageModuleUtilities = (import ../../package-modules/utilities.nix);

  packageModuleIDs = metaConfig.packageModuleIDs;

  packageModule = packageModuleUtilities.combinePackageModules { packageModules = packageModuleUtilities.getPackageModules { inherit packageModuleIDs; }; };

  packageModuleModulePaths = packageModuleUtilities.genHomeModulePaths { prefix = ../../home; inherit packageModule; };
in
{
  imports = packageModuleModulePaths ++ [];

  options = {
    metaConfig = metaConfigOptions;
  };

  config = {
    inherit metaConfig;

    home.username = metaConfig.user.username;
    home.homeDirectory = "/home/${metaConfig.user.username}";

    home.stateVersion = "25.11";
  };
}
