{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  imports = [
    ../../system/
  ];

  config = {


    # Globally installed packages
    environment.systemPackages = with pkgs; [

      # WM
      sway

      # Terminal
      fish

      # Utilities
      neovim
      curl
      git
      openssh
      doas
    ];
  }
}