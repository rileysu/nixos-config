{ config, lib, pkgs, userSettings, systemSettings, ... }:
let
  themeUtilities = (import ../themes/utilities.nix);
  theme = themeUtilities.getTheme { inherit userSettings; };
in
{
  config = {
    console.colors = [
      theme.black
      theme.red
      theme.green
      theme.yellow
      theme.blue
      theme.magenta
      theme.cyan
      theme.white
      theme.brightBlack
      theme.brightRed
      theme.brightGreen
      theme.brightYellow
      theme.brightBlue
      theme.brightMagenta
      theme.brightCyan
      theme.brightWhite
    ];
  };
}