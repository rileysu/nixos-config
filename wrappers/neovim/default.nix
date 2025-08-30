{ config, lib, pkgs, userSettings, systemSettings, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { inherit userSettings; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    conf = pkgs.writeText "init.lua" ((import ./conf.nix) { inherit pkgs userSettings systemSettings themeNamed; });
  in {
    config = {
      wrappers.neovim = {
        basePackage = pkgs.neovim;

        programs.nvim = {
          prependFlags = [
            "-u"
            "${conf}"
          ];
        };
      };
    };
  }