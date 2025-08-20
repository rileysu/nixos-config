{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    defaultEditorLine = 
      if systemSettings.defaultEditorCommand != null 
        then "$env.config.buffer_editor = ${systemSettings.defaultEditorCommand}" 
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