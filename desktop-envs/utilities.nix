rec {
  baseEnv = {
    name = null;

    config = {
      packageModuleIDs = [];

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

        displays = [
          #{
          #  identifier = null;
          #  mode = null;
          #  allowTearing = false;
          #}
        ];
      };

      bar = {
        sound.enabled = false;
        brightness.enabled = false;
        battery.enabled = false;
      };


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

  importProfile = { profile, lib, pkgs, userSettings, systemSettings }:
    deepMerge (deepMerge baseEnv
    (if profile != null then
      ((import ./${profile}.nix) { inherit lib pkgs userSettings systemSettings; })
    else
      {}
    )) systemSettings.desktopEnvOverrides;

  getDesktopEnvName = { profile, lib, pkgs, userSettings, systemSettings }:
    (importProfile { inherit profile lib pkgs userSettings systemSettings; }).name;

  getDesktopEnvConfig = { profile, lib, pkgs, userSettings, systemSettings }:
    (importProfile { inherit profile lib pkgs userSettings systemSettings; }).config;
}
