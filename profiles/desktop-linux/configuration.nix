{ config, lib, pkgs, userSettings, systemSettings, ... }:

let
  packageSet = (import ../../package-set/desktop-linux.nix);
  packageSetUtilities = (import ../../package-set/utilities.nix);

  systemPackages = packageSetUtilities.genSystemPackages { inherit pkgs; inherit packageSet; };
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

    xdg.portal.config.common.default = "*";

    # Globally installed packages
    environment.systemPackages = systemPackages;

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