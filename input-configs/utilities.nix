rec {
  baseEnv = {
    packageModuleIDs = [];

    system = {
      hardware = null;
      hostname = null;
      systemProfile = null;
    };

    time = {
      timezone = null;
    };

    locale = {
      default = null;
      extra = [ ];
    };

    theme = {
      name = null;
      wallpaper = null;
    };

    # TODO
    # Add multiuser
    user = {
      username = null;
      name = null;
      email = null;
    };

    greeter = {
      launchCommand = null;
    };

    shell = {
      defaultCommand = null;
    };

    editor = {
      defaultCommand = null;
    };

    terminal = {
      defaultCommand = null;
    };

    windowManager = {
      volume.enabled = false;
      brightness.enabled = false;

      chooser = {
        defaultCommand = null;  
        defaultRunCommand = null;  
      };

      cursor = {
        enabled = false;

        themeName = null;
        size = null;
      };
    
      notificationDaemon = {
        enabled = false;

        defaultCommand = "mako";
      };
      
      bar = {
        enabled = false;

        defaultCommand = null;
        integrated = true;

        sound.enabled = false;
        brightness.enabled = false;
        battery.enabled = false;
      };

      displays = [
        #{
        #  identifier = null;
        #  mode = null;
        #  allowTearing = false;
        #}
      ];
    };
  };

  deepMerge =
    lhs: rhs:
    lhs 
    // rhs
    // (builtins.mapAttrs (
      rName: rValue:
      let 
        lValue = lhs.${rName} or null;
      in
      if builtins.isAttrs lValue && builtins.isAttrs rValue then
        deepMerge lValue rValue
      else if builtins.isList lValue && builtins.isList rValue then
        lValue ++ rValue
      else
        rValue
    ) rhs);

  importProfile = { profile }:
    builtins.foldl'
      deepMerge
      {}
      [
        baseEnv
        (import ./${profile}.nix)
      ];
}
