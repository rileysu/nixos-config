{ config, lib, pkgs, inputConfig, ... }: 
  let
    defaultEditorLine = 
      if inputConfig.editor.defaultCommand != null 
        then "$env.config.buffer_editor = ${inputConfig.editor.defaultCommand}" 
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
          "--ozone-platform-hint=auto"
        ];
      };
    };
  }
