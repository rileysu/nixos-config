{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  imports = [
    ./base.nix
  ];

  config = 
    let
      mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
    in
    {
    home.file.".mozilla" = {
      recursive = true;
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/.var/app/org.mozilla.firefox/.mozilla";
    };
    };
}