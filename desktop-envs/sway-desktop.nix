{ lib, pkgs, userSettings, systemSettings }:
let 
  utilities = import ./utilities.nix;

  base = (import ./bases/sway-base.nix) { inherit lib pkgs userSettings systemSettings; };
in
utilities.deepMerge base
{
  name = "Sway Desktop";
  
  config = {
    packageModuleIDs = [];

    windowManager = {
      volume.enabled = true; 

      bar = {
        enabled = true;

        defaultCommand = "waybar";
        integrated = false;

        sound.enabled = true;
      };
    };
  };
}
