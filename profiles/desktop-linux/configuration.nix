{ config, lib, pkgs, userSettings, systemSettings, ... }:

let
  packageSet = (import ../../package-set/desktop-linux.nix);
  packageSetUtilities = (import ../../package-set/utilities.nix);

  systemPackages = packageSetUtilities.genSystemPackages { inherit pkgs; inherit packageSet; };
  fontPackages = packageSetUtilities.genFontPackages { inherit pkgs; inherit packageSet; };
  flatpakPackages = packageSetUtilities.genFlatpakPackages { inherit pkgs; inherit packageSet; };
in 
{
  imports = [
    ../../system/graphics.nix
    ../../system/locale.nix
    ../../system/networking/general.nix
    ../../system/time.nix
    ../../system/user.nix
  ];

  config = {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    xdg.portal.wlr.enable = true;
    xdg.portal.enable = true;

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