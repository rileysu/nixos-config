{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  config = {
    programs.fish = {
      enable = true;
      package = pkgs.emptyDirectory;
    };

    users.defaultUserShell = pkgs.fish;
  };
}