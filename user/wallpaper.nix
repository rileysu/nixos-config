{ config, lib, pkgs, userSettings, systemSettings, ... }:


{
  config = {
    home.file.".wallpapers/${userSettings.wallpaper}" = {
      source = ../../wallpapers/${userSettings.wallpaper};
    };
  };
}