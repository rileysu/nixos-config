{ config, lib, pkgs, inputConfig, ... }:

{
  config = {
    services.udisks2 = {
      enable = true;
    };
  };
}
