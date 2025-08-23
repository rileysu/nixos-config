rec {
  baseEnv = {
    name = null;

    config = {
      launchCommand = null;
    
      sway = {
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