{ config, lib, pkgs, inputConfig, ... }:

{
  config = {
    programs.fish = {
      enable = true;
      package = pkgs.emptyDirectory;
    };

    users.defaultUserShell = pkgs.fish;
  };
}