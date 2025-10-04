{ config, lib, pkgs, ... }:

{
  config = {
    # ADB
    programs.adb.enable = true;
    users.users.${config.metaConfig.user.username}.extraGroups = [ "adbusers" ];
  };
}