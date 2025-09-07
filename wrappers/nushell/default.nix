{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    desktopEnvUtilities = import ../../desktop-envs/utilities.nix;
    desktopEnvConfig = desktopEnvUtilities.getDesktopEnvConfig { profile = systemSettings.desktopEnvProfile; };

    defaultEditorLine = 
      if desktopEnvConfig.editor.defaultCommand != null 
        then "$env.config.buffer_editor = ${desktopEnvConfig.editor.defaultCommand}" 
        else "";
        
    conf = pkgs.writeText "config.nu" 
    ''
      ${defaultEditorLine}

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