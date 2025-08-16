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
            "#${theme.blue}"
            "--tf"
            "#${theme.black}"

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
            "#${theme.blue}"
            "--hf"
            "#${theme.black}"
            "--sb"
            "#${theme.blue}"
            "--sf"
            "#${theme.black}"
          ];
        };
      };
    };
  }