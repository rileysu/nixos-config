let
  utilities = import ./../utilities.nix;

  base = (import ./bases/sway-base.nix);
in
utilities.deepMerge base {
  packageModuleIDs = [ 
    "window-managers/sway-desktop"
  ];

  windowManager = {
    volume.enabled = true;

    bar = {
      enabled = true;

      defaultCommand = "waybar";
      integrated = false;

      sound.enabled = true;
    };
  };
}
