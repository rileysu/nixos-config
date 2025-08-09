{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  imports = [
    ../../system/locale.nix
    ../../system/networking.nix
    ../../system/time.nix
    ../../system/user.nix
  ];

  config = {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    xdg.portal.wlr.enable = true;
    xdg.portal.enable = true;

    # Globally installed packages
    environment.systemPackages = with pkgs; [
      # WM
      sway
      wmenu

      # Terminal/Shell
      alacritty
      fish

      # Utilities
      neovim
      curl
      git
      openssh
      doas
    ];

    # Flatpak
    services.flatpak.enable = true;
    services.flatpak.packages = [
      "org.mozilla.firefox"
    ];

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    system.stateVersion = "25.05";
  };
}