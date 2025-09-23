{ config, lib, pkgs, inputConfig, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = inputConfig.theme.name; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    conf = pkgs.writeText "init.lua" ((import ./conf.nix) { inherit pkgs themeNamed inputConfig; });
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