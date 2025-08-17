{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };
    themeNamed = themeUtilities.toNamed { inherit theme; };
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
            "#${themeNamed.foreground}"
            "--tf"
            "#${themeNamed.background}"

            "--fb"
            "#${themeNamed.background}"
            "--ff"
            "#${themeNamed.foreground}"

            "--cb"
            "#${themeNamed.foreground}"
            "--cf"
            "#${themeNamed.background}"

            "--nb"
            "#${themeNamed.background}"
            "--nf"
            "#${themeNamed.foreground}"
            "--ab"
            "#${themeNamed.background}"
            "--af"
            "#${themeNamed.foreground}"

            "--hb"
            "#${themeNamed.foreground}"
            "--hf"
            "#${themeNamed.background}"
            "--sb"
            "#${themeNamed.foreground}"
            "--sf"
            "#${themeNamed.background}"
          ];
        };
      };
    };
  }