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

        cursor = {
          enabled = false;

          themeName = null;
          size = null;
        };
      };

      bar = {
        sound.enabled = false;
        brightness.enabled = false;
        battery.enabled = false;
      };
    };
  };

  importProfile = { profile }:
    baseEnv //
    (if profile != null then
      (import ./${profile}.nix)
    else
      {}
    );

  getDesktopEnvName = { profile }:
    (importProfile { inherit profile; }).name;

  getDesktopEnvConfig = { profile }:
    (importProfile { inherit profile; }).config;
}