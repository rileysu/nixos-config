{ config, lib, pkgs, ... }:

{
  config = {
    services.udisks2 = {
      enable = true;
    };
  };
}
