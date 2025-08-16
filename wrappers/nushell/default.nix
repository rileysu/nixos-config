{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    conf = pkgs.writeText "config.nu" 
    ''
      $env.config.buffer_editor = "${userSettings.defaultEditor}"

      echo Hello World!
    '';
  in {
    config = {
      wrappers.nushell = {
        basePackage = pkgs.nushell;

        prependFlags = [
          "--config"
          "${conf}"
        ];
      };
    };
  }