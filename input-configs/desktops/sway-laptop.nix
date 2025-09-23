let
  utilities = import ./../utilities.nix;

  base = import ./bases/sway-base.nix;
in
utilities.deepMerge base {
  packageModuleIDs = [ ];

  windowManager = {
    volume.enabled = true;
    brightness.enabled = true;

    bar = {
      enabled = true;

      defaultCommand = "waybar";
      integrated = false;

      sound.enabled = true;
      brightness.enabled = true;
      battery.enabled = true;
    };
  };
}
