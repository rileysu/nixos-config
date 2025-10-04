{ config, lib, pkgs, ... }: 
  let
    defaultEditorLine = 
      if config.metaConfig.editor.defaultCommand != null 
        then "$env.config.buffer_editor = ${config.metaConfig.editor.defaultCommand}" 
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
