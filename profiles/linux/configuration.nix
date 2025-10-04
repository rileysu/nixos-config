{ config, lib, pkgs, metaConfigProfile, wrapper-manager, ... }:

let
  metaConfigUtilities = (import ../../meta-configs/utilities.nix);
  metaConfigOptions = metaConfigUtilities.getOptions { inherit lib; };
  metaConfig = metaConfigUtilities.importProfile { profile = metaConfigProfile; };

  packageModuleUtilities = (import ../../package-modules/utilities.nix);
  wrapperUtilities = (import ../../wrappers/utilities.nix);

  wrapperPkgs = wrapperUtilities.genWrapperPkgs { inherit wrapper-manager; inherit pkgs; inherit metaConfigProfile; };

  packageModuleIDs = metaConfig.packageModuleIDs;

  packageModule = packageModuleUtilities.combinePackageModules { packageModules = packageModuleUtilities.getPackageModules { inherit packageModuleIDs; }; };

  systemPackages = packageModuleUtilities.genSystemPackages { inherit pkgs; inherit packageModule; };
  wrappedPackages = packageModuleUtilities.genWrappedPackages { pkgs = wrapperPkgs; inherit packageModule; };
  fontPackages = packageModuleUtilities.genFontPackages { inherit pkgs; inherit packageModule; };
  flatpakPackages = packageModuleUtilities.genFlatpakPackages { inherit pkgs; inherit packageModule; };

  packageModuleModulePaths = packageModuleUtilities.genSystemModulePaths { prefix = ../../system; inherit packageModule; };
in 
{
  imports = packageModuleModulePaths ++ [
    ../../system/console.nix
    ../../system/graphics.nix
    ../../system/locale.nix
    ../../system/networking/general.nix
    ../../system/time.nix
    ../../system/user.nix
  ];

  options = {
    metaConfig = metaConfigOptions;
  };

  config = {
    inherit metaConfig;

    nixpkgs.config.allowUnfree = true;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Globally installed packages
    environment.systemPackages = systemPackages ++ wrappedPackages;

    # Default Shell    
    users.defaultUserShell = wrapperPkgs.nushell;

    # Fonts
    fonts.packages = fontPackages;

    # Flatpak
    services.flatpak = {
      enable = true;
      packages = flatpakPackages;
    };

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    system.stateVersion = "25.05";
  };
}
