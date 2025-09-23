{ config, lib, pkgs, inputConfig, ... }:

{
  config = {
    users.users.${inputConfig.user.username} = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      packages = with pkgs; [];
    };
  };
}