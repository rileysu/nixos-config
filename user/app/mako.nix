{ config, lib, pkgs, userSettings, systemSettings, ... }:

let
  theme = (import ../../themes/${userSettings.theme}.nix);
in {
  config = {
    services.mako = {
      enable = true;

      settings = {
        # General settings
        max-visible = 5;
        sort = "-time";
        layer = "top";
        anchor = "top-right";
        
        # Positioning
        width = 248;
        height = 128;
        margin = 10;
        padding = 10;
        
        # Colors from theme
        background-color = "#${theme.background}";
        text-color = "#${theme.foreground}";
        border-color = "#${theme.blue}";
        border-size = 1;
        border-radius = 8;
        
        # Progress bar
        progress-color = "#${theme.blue}";
        
        # Icons
        icons = true;
        max-icon-size = 32;
        
        # Font
        font = "Roboto Mono 10";
        
        # History
        history = true;
      };
    };
  };
}