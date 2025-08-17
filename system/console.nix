{ config, lib, pkgs, userSettings, systemSettings, ... }:
let
  themeUtilities = (import ../themes/utilities.nix);
  theme = themeUtilities.getTheme { inherit userSettings; };
  themeANSI = themeUtilities.toANSI { inherit theme; };
in
{
  config = {
    console.colors = [
      themeANSI.black
      themeANSI.red
      themeANSI.green
      themeANSI.yellow
      themeANSI.blue
      themeANSI.magenta
      themeANSI.cyan
      themeANSI.white
      themeANSI.brightBlack
      themeANSI.brightRed
      themeANSI.brightGreen
      themeANSI.brightYellow
      themeANSI.brightBlue
      themeANSI.brightMagenta
      themeANSI.brightCyan
      themeANSI.brightWhite
    ];
  };
}