{ config, lib, pkgs, ... }:

{
  config = {
    users.users.${config.metaConfig.user.username} = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      packages = with pkgs; [];
    };
  };
}