{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  config = {
    services.udisks2 = {
      enable = true;
    };
  };
}
