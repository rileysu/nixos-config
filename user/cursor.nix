{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  config = {
    home.pointerCursor = {
      enable = true;
      sway.enable = true;

      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 22;
    };
  };
}