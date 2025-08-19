{ config, lib, pkgs, userSettings, systemSettings, wrapper-manager, ... }:

let
  packageModuleUtilities = (import ../../package-modules/utilities.nix);
  wrapperUtilities = (import ../../wrappers/utilities.nix);

  wrapperPkgs = wrapperUtilities.genWrapperPkgs { inherit wrapper-manager; inherit pkgs; inherit userSettings; inherit systemSettings; };

  packageModuleIDs = [
    "greeters/tuigreet"

    "desktop-envs/sway"
    "utilities/brightnessctl"
    "fonts"

    "services/pipewire"

    "general-cli-apps"

    "shells/nushell"

    "terminals/alacritty"
    "browsers/brave"
  ];

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

  config = {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    xdg.portal.enable = true;
    xdg.portal.extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
    xdg.portal.config.common.default = "*";

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