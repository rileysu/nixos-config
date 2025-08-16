{ config, lib, pkgs, userSettings, systemSettings, wrapper-manager, ... }:

let
  packageSet = (import ../../package-set/laptop-linux.nix);
  packageSetUtilities = (import ../../package-set/utilities.nix);
  wrapperUtilities = (import ../../wrappers/utilities.nix);

  wrapperPkgs = wrapperUtilities.genWrapperPkgs { inherit wrapper-manager; inherit pkgs; inherit userSettings; inherit systemSettings; };

  systemPackages = packageSetUtilities.genSystemPackages { inherit pkgs; inherit packageSet; };
  wrappedPackages = packageSetUtilities.genWrappedPackages { pkgs = wrapperPkgs; inherit packageSet; };
  fontPackages = packageSetUtilities.genFontPackages { inherit pkgs; inherit packageSet; };
  flatpakPackages = packageSetUtilities.genFlatpakPackages { inherit pkgs; inherit packageSet; };

  packageSetModulePaths = packageSetUtilities.genSystemModulePaths { prefix = ../../system; inherit packageSet; };
in 
{
  imports = packageSetModulePaths ++ [
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