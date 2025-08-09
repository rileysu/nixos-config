{ config, lib, pkgs, userSettings, systemSettings, ... }:

let
  theme = (import ../../themes/${userSettings.theme}.nix);
in
{
  config = {
    programs.alacritty = {
      enable = true;

      settings = {
        font = {
          normal = {
            family = "MonaspiceNe Nerd Font";
            style = "Medium";
          };
          bold = {
            family = "MonaspiceNe Nerd Font";
            style = "Bold";
          };
          italic = {
            family = "MonaspiceNe Nerd Font";
            style = "Italic";
          };
          bold_italic = {
            family = "MonaspiceNe Nerd Font";
            style = "Bold Italic";
          };
          size = 10.0;
        };

        colors = {
          primary = {
            background = "#${theme.background}";
            foreground = "#${theme.foreground}";
          };

          # Normal colors
          normal = {
            black = "#${theme.black}";
            red = "#${theme.red}";
            green = "#${theme.green}";
            yellow = "#${theme.yellow}";
            blue = "#${theme.blue}";
            magenta = "#${theme.magenta}";
            cyan = "#${theme.cyan}";
            white = "#${theme.white}";
          };

          # Bright colors
          bright = {
            black = "#${theme.brightBlack}";
            red = "#${theme.brightRed}";
            green = "#${theme.brightGreen}";
            yellow = "#${theme.brightYellow}";
            blue = "#${theme.brightBlue}";
            magenta = "#${theme.brightMagenta}";
            cyan = "#${theme.brightCyan}";
            white = "#${theme.brightWhite}";
          };
        };

        window = {
          opacity = 0.9;
        };
      };
    };
  };
}