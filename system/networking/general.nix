{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  config = {
    networking.hostName = systemSettings.hostname; # Define your hostname.
    # Pick only one of the below networking options.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  };
}