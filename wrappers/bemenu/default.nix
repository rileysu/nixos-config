{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };
  in {
    config = {
      wrappers.bemenu = {
        basePackage = pkgs.bemenu;

        programs.bemenu-run = {
          prependFlags = [
            "--prompt"
            "run:"
            "--list"
            "16"
            "--fn"
            "Roboto Mono Regular 10"
            "-H"
            "24"

            "--tb"
            "#${theme.foreground}"
            "--tf"
            "#${theme.background}"

            "--fb"
            "#${theme.background}"
            "--ff"
            "#${theme.foreground}"

            "--cb"
            "#${theme.foreground}"
            "--cf"
            "#${theme.background}"

            "--nb"
            "#${theme.background}"
            "--nf"
            "#${theme.foreground}"
            "--ab"
            "#${theme.background}"
            "--af"
            "#${theme.foreground}"

            "--hb"
            "#${theme.foreground}"
            "--hf"
            "#${theme.background}"
            "--sb"
            "#${theme.foreground}"
            "--sf"
            "#${theme.background}"
          ];
        };
      };
    };
  }