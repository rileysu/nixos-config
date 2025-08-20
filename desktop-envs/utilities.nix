rec {
  baseEnv = {
    name = null;

    config = {
      launchCommand = null;
    
      sway = {
        volume.enabled = false;
        brightness.enabled = false;
      };

      bar = {
        sound.enabled = false;
        brightness.enabled = false;
        battery.enabled = false;
      };
    };
  };

  getDesktopEnvName = { profile }:
    (if profile != null then (import ./${profile}.nix).name else {});

  getDesktopEnvConfig = { profile }:
    baseEnv.config // (if profile != null then (import ./${profile}.nix).config else {});
}