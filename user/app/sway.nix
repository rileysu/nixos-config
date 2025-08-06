{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  config = {
    wayland.windowManager.sway.enable = true;
    wayland.windowManager.sway.config = 
      let
        modifier = "Mod4";
        terminal = "alacritty";
      in {
        modifier = modifier;
        terminal = terminal;

        keybindings = {
          "${modifier}+Return" = "exec ${terminal}";
        };
      };
  };
}